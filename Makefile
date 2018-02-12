
all: toy

libfoobar.so: foobar.o foo.o bar.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -shared -o libfoobar.so foobar.o foo.o bar.o

# This produces two targets
foobar.nms foobar.o: foobar.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules -fmodule-wrapper=false -c foobar.cpp

foo.o: foobar.nms foo.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules -fmodule-wrapper=false -c foo.cpp

bar.o: foobar.nms bar.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules -fmodule-wrapper=false -c bar.cpp

toy.o: toy.cpp
	$(HOME)/bin_modules/bin/g++ -std=c++17 -fmodules -fmodule-wrapper=false -c toy.cpp

toy:  libfoobar.so toy.o
	$(HOME)/bin_modules/bin/g++ -std=c++17 -o toy toy.o -L. -lfoobar


clean:
	rm -f a.out *.nms *.o *.so *.exe *.core
