default: all

all:
	./docs/build-readme.raku
	mi6 build

help:
	raku -Ilib ./bin/photo h

show:
	raku -Ilib ./bin/photo knuth.jpg show

display:
	raku -Ilib ./bin/photo knuth.jpg display
