
CC = gcc
LDFLAGS = -lrt -lpcap
CPPFLAGS = -Wall

all: tx rx rx_status_test

%.o: %.c
	$(CC) $(CPPFLAGS) -c $< -o $@

rx: rx.o lib.o radiotap.o fec.o
	$(CC) $(LDFLAGS) $^ -o $@ 

tx: tx.o lib.o fec.o
	$(CC) $(LDFLAGS) $^ -o $@

rx_status_test: rx_status_test.o
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -f rx_status_test rx tx *.o

