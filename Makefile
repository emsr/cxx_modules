
all: toy atomic_dawg

libfoobar.so: foobar.o foo.o bar.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -shared -o libfoobar.so foobar.o foo.o bar.o

# This produces two targets
foobar.nms foobar.o: foobar.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-ts -c foobar.cpp

foo.o: foobar.nms foo.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-ts -c foo.cpp

bar.o: foobar.nms bar.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-ts -c bar.cpp

toy.o: foobar.nms toy.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-ts -c toy.cpp

toy:  libfoobar.so toy.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -o toy toy.o -L. -lfoobar


libdawg.so: dawg.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -shared -o libdawg.so dawg.o

dawg.nms dawg.o: dawg.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-atom -c dawg.cpp

atomic_dawg.o: dawg.nms atomic_dawg.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules-atom -c atomic_dawg.cpp

atomic_dawg: libdawg.so atomic_dawg.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -o atomic_dawg atomic_dawg.o -L. -ldawg


clean:
	rm -f a.out *.nms *.o *.so *.exe *.core
