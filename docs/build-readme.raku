#!/usr/bin/env raku

# Called by the Makefile at the top repo module directory
# so 'subdir's are called like this: ./subdir

my $doc-dir = "./docs";
# the main source file
my $src = "$doc-dir/readme.rakudoc"; # which provides parts 1 and 3

my $part1 = "$doc-dir/parts/readme.part1";
my $part2 = "$doc-dir/parts/readme.part2";
my $part3 = "$doc-dir/parts/readme.part3";
# the output file which is transformed to the github README.md
my $doc = "$doc-dir/readme/README.rakudoc";

# generate parts 1 and 3 from $src
gen-parts1and3 :$src, :$part1, :$part3;
# gen part 2
shell("raku -Ilib ./bin/photo help > $part2");


# gen the final doc:
my $final = slurp $part1;
$final   ~= slurp $part2;
$final   ~= slurp $part3;
spurt $doc, $final;

#### subroutines ####
sub gen-parts1and3(:$src!, :$part1!, :$part3!, :$debug) {
    my $fh1 = open $part1, :w;
    my $fh3 = open $part3, :w;

    my $use-fh1 = True;
    LINE: for $src.IO.lines -> $line {
        if $line.contains('Z<') {
            $use-fh1 = False;
            # ignore this line
            next LINE;
        }

        if $use-fh1 {
            $fh1.say: $line;
        }
        else {
            $fh3.say: $line;
        }
    }
    $fh1.close;
    $fh3.close;
}

