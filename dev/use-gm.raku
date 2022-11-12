#!/usr/bin/env raku

use lib "../lib";
use GraphicsMagick;

my $image = get-test-image;
my $o = GM.new: :$image;
print qq:to/HERE/;
image:           {$o.image.IO.basename}
time:            {$o.localtime.Str} 
width (pixels):  {$o.width}
height (pixels): {$o.height}
HERE


