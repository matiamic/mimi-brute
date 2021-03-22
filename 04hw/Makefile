CFLAGS+=  -pedantic -Wall -std=c99 -O0 -g
HW=hw04-b3b36prg
ZIP=zip

$(HW): grep.c 
	$(CC) $(CFLAGS) grep.c -o $(HW)

zip:
	$(ZIP) $(HW)-brute.zip grep.c

clean:
	$(RM) *.o
	$(RM) $(HW)
	$(RM) $(HW)-brute.zip

test:
	./test_hw04.sh $(HW)

testo:
	./test_hw04.sh $(HW) opt

.PHONY: clean zip
