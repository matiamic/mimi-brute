#!/bin/sh

HW=06
PROGRAM=./b3b36prg-hw$HW-test
LIB=libqueue.so

echo "Test the current libqueue.so"
$PROGRAM

echo ""
echo "Test the current libqueue.so for the -prg-optional"

$PROGRAM -prg-optional
