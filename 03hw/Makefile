CFLAGS+=  -pedantic -Wall -std=c99 -O0 -g
HW=hw03-b3b36prg
ZIP=zip

$(HW): main.c 
	$(CC) $(CFLAGS) main.c -o $(HW)

zip:
	$(ZIP) $(HW)-brute.zip main.c

clean:
	$(RM) *.o
	$(RM) $(HW)
	$(RM) $(HW)-brute.zip

test:
	./test_hw03.sh $(HW)

testo:
	./test_hw03.sh '$(HW) -prg-optional' opt

.PHONY: clean zip
