# Extended C++ warning policy
CXXFLAGS += -Werror -Wall -Wextra -Wshadow -Wpedantic -Wformat-nonliteral \
            -Wformat-security -Wswitch-default -Wuninitialized -Wundef \
            -Wpointer-arith -Woverloaded-virtual -Wctor-dtor-privacy \
            -Wnon-virtual-dtor -Woverloaded-virtual -Wsign-promo \
            -Wno-unused-parameter -Weffc++

all: xmltest staticlib

rebuild: clean all

xmltest: xmltest.cpp libtinyxml2.a

clean:
	$(RM) *.o xmltest libtinyxml2.a
	
test: clean xmltest
	./xmltest

staticlib: libtinyxml2.a

libtinyxml2.a: tinyxml2.o
	$(AR) $(ARFLAGS)s $@ $^
	
tinyxml2.o: tinyxml2.cpp tinyxml2.h

