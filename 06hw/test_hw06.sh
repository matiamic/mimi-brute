#!/bin/bash

#TEST FOR PRG-HW06

#author: odvaznymladymuz matiamic@fel.cvut.cz
#https://www.youtube.com/watch?v=qyJbYVciah0

shopt -s nullglob

path=./data/
valgrind_exit_code=236
kill_exit_code=137
segfault_exit_code=139

timeout_sec=5
timeout_func='timeout -s KILL '$timeout_sec #substitue with '' if timeout doesn't work

vimoptions="+set splitright | set splitbelow"

vim --version &> /dev/null
got_vim=$?  # zero if installed

valgrind --version &> /dev/null
got_valgrind=$? # zero if installed


if [ $# -lt 1 ]
then
    echo 'Je treba zadat filename programu'
    exit 1
fi

program=$1

if [ $# -gt 1 ]
then
    if [ $2 = 'opt' ]
    then
        path+=opt/
    else
        echo 'Nerozumim argumentum'
        exit 2;
    fi
else
    path+=man/
fi

for file in $(find $path -name '*.in');
do
    problempath=.$(echo $file | cut -d'.' -f 2) # cuts path into 3 parts divided by '.',
    #then returns the second one, auxiliary
    problemname=$(echo $problempath | cut -d'/' -f 4-)

    echo -n 'Srovnavam problem '; tput setaf 3; echo $problemname; tput sgr0;
    #EXECUTION
    $timeout_func ./$program < $problempath.in > $path/out 2> $path/err
    #end execution
    #EVAL
    err=$?
    segfault=0
    if [ $err -eq $kill_exit_code ] # 137 means timeout sent kill signal
    then
        tput setaf 1; echo  'TIMEOUT u problemu' $problemname 'po' $timeout_sec's'; tput sgr0;
        if [ $got_vim -eq 0 ] # vim installed
        then
            read -p 'Zobrazit vstup ve vimu? (y/n)[n]' openvimdiff 
            if [ -z $openvimdiff ]
            then
                openvimdiff='n'
            fi
            if [ $openvimdiff = 'y' ]
            then
                vim $problempath.in
            fi
        else
            echo 'Pro plnou funkcionalitu nainstaluj vim'
        fi
        echo ''
        continue
    fi
    if [ $err -eq $segfault_exit_code ] # 139 means segfault
    then
        tput setaf 1; echo  'SEGFAULT u problemu' $problemname; tput sgr0;
        segfault=1
    fi
    if [ $segfault -eq 0 ] # don't compare segfaulted
    then
        cmp -s $path/out $problempath.out
        if [ $? -ne 0 ]
        then
            tput setaf 1; echo 'Nesedi stdout u problemu' $problemname; tput sgr0;
            if [ $got_vim -eq 0 ] # vim installed
            then
                read -p 'Otevrit ve vimdiffu? (y/n)[n]' openvimdiff 
                if [ -z $openvimdiff ]
                then
                    openvimdiff='n'
                fi
                if [ $openvimdiff = 'y' ]
                then
                    vim "$vimoptions" $problempath.in "+split $path/out" "+vert diffsplit $problempath.out"
                fi
            else
                echo 'Pro plnou funkcionalitu nainstaluj vim'
            fi
        else
            tput setaf 2; echo 'Stdout u problemu' $problemname 'OK.'; tput sgr0;
        fi

        cmp -s $path/err $problempath.err
        if [ $? -ne 0 ]
        then
            tput setaf 1; echo  'Nesedi stderr u problemu' $problemname; tput sgr0;
            if [ $got_vim -eq 0 ] # vim installed
            then
                read -p 'Otevrit ve vimdiffu? (y/n)[n]' openvimdiff 
                if [ -z $openvimdiff ]
                then
                    openvimdiff='n'
                fi
                if [ $openvimdiff = 'y' ]
                then
                    vim "$vimoptions" $problempath.in "+split $path/err" "+vert diffsplit $problempath.err"
                fi
            else
                echo 'Pro plnou funkcionalitu nainstaluj vim'
            fi
        else
            tput setaf 2; echo 'Stderr u problemu' $problemname 'OK.'; tput sgr0;
        fi
        echo 'Exit code: '$err
    fi #segfault check
    #end eval

    #VALGRIND
    if [ $got_valgrind -eq 0 ]
    then
        valgrind --leak-check=full --error-exitcode=$valgrind_exit_code ./$program < $problempath.in &> $path/valgrind.txt
        err=$?
        if [ $err -eq $valgrind_exit_code ] || [ $segfault -eq 1 ]
        then
            tput setaf 1; echo 'Valgrindrovi se to nelibi'; tput sgr0;
            read -p 'Otevrit jeho vystup ve vimu? (y/n)[n]' openvim 
            if [ -z $openvim ]
            then
                openvim='n'
            fi
            if [ $openvim = 'y' ]
            then
                vim "$vimoptions" $path/valgrind.txt "+vsp $problempath.in"
            fi
        else
            tput setaf 2; echo 'Valgrind u problemu' $problemname 'OK.'; tput sgr0;
        fi
    else
        echo 'Pro plnou funckionalitu nainstaluj valgrind'
    fi
    #end valgrind
    echo ''
done
exit 0
