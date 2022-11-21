#!/usr/bin/env raku

my $fil  = "../lib/GraphicsMagick/GM.rakumod";
my $fil2 = "../.github/workflows/macos.yml";

#for $fil.IO.lines.kv -> $i, $line {
for $fil2.IO.lines.kv -> $i, $line {
    my $n = 1 + $i;
    next if $line !~~ /\S+/;
    say "Analyzing line $n: $line";
    my $nc = $line.chars;

    print "  $nc chars: ";
    for $line.comb -> $c {
        print "|$c";
    }
    say "|";
    #say "  Uninames: {$line.uninames}";
    say "  Uniprops: {$line.uniprops}";
    #say "  Ascii: {$line.encode("ascii").decode("ascii")}";
}
