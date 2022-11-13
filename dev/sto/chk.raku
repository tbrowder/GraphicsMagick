#!/usr/bin/env raku

my $year = "2012:03:22";
my ($y, $m, $d);

if $year ~~ /^ \h* (\d**4) ':' (\d**2) ':' (\d**2) \h* $/ {
    $y = +$0;
    $m = +$1;
    $d = +$2;
}
else {
    die "";
}

say "year:  '$y'";
say "month: '$m'";
say "day:   '$d'";

=finish

use Text::Utils :ALL;

my $f = "./identity.lines";
for $f.IO.lines -> $line {
    say $line;
    my $n = count-substrs $line, ':';
    say "  $n colons" if $n;
}


