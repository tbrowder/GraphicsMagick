#!/usr/bin/env raku

use lib "../lib";
use GraphicsMagick::GM;
use GraphicsMagick::Utils;

my $image = get-test-image;
my $o = GM.new: :$image;
print qq:to/HERE/;
image:           {$o.image.IO.basename}
time:            {$o.localtime.defined ?? $o.localtime.Str !! '(unknown)';} 
width (pixels):  {$o.width}
height (pixels): {$o.height}
HERE

exit;

say "== Dumping all attributes";
my @keys = $o.attributes.keys.sort;
for @keys -> $k {
    my $v = $o.attributes{$k};
    if $k ~~ /:i image \h* description/ {
        say "key '$k' ==>";
        my @s = split /\\015\\012/, $v;
        say $_ for @s;
        next;
    }

    say "key '$k' ==> '$v'";
}
say "== End dumping all attributes";



