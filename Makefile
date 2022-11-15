default: all

all:
	./dev/build-readme.raku
debug:
	raku -Ilib ./bin/photo 
