CFLAGS+=  -pedantic -Wall -std=c99 -O3
HW=hw06-b3b36prg
ZIP=zip

all: $(HW) lib

$(HW): main.c queue.o
	$(CC) $(CFLAGS) main.c queue.o -o $(HW)

queue.o: queue.c queue.h
	$(CC) $(CFLAGS) -c queue.c -o queue.o

libqueue.so: queue.c queue.h
	$(CC) $(CFLAGS) -fPIC -shared queue.c -o libqueue.so
	$(STRIP) $(lib)

lib: libqueue.so

zip:
	$(ZIP) $(HW)-brute.zip queue.h queue.c

clean:
	$(RM) *.o
	$(RM) $(HW) libqueue.so
	$(RM) $(HW)-brute.zip

.PHONY: clean zip
