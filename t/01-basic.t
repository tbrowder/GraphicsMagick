use Test;
use GraphicsMagick;

my $image = get-test-image;
my $o = GM.new: :$image;

is $o.image.IO.basename, "tbrowder.jpg";
is $o.width, 960;
is $o.height, 1280;
is $o.localtime.year, 2014;
is $o.localtime.month, 7;
is $o.localtime.day, 12;
is $o.localtime.hour, 6;
is $o.localtime.minute, 3;
is $o.localtime.second, 44;

done-testing;

