CFLAGS+=  -pedantic -Wall -std=c99 -O3
HW=hw05-b3b36prg
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
	./test_hw05.sh $(HW)

testo:
	./test_hw05.sh $(HW) opt

.PHONY: clean zip
