use Test;
use GraphicsMagick;
use File::Find;

my @images = find :dir("./resources/images"), :type("file"), :name(/'.jpg'$/);
for @images -> $image-path {
    #note "DEBUG: $image-path";
    my $o = GM.new: :image($image-path);
    my $image = $image-path.basename;
    if $image eq "Bruennhilde.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 157;
        is $o.height, 157;
        is $o.time, "2009-05-27T13:57:36";
    }
    elsif $image eq "Pythagoras.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 449;
        is $o.height, 599;
        is $o.time, "(unknown)";
    }
    elsif $image eq "author.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 163;
        is $o.height, 186;
        is $o.time, "(unknown)";
    }
    elsif $image eq "craigbradney.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 202;
        is $o.height, 263;
        is $o.time, "(unknown)";
    }
    elsif $image eq "dan1.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 221;
        is $o.height, 302;
        is $o.time, "(unknown)";
    }
    elsif $image eq "drh1.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 224;
        is $o.height, 300;
        is $o.time, "(unknown)";
    }
    elsif $image eq "grace_hopper.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 512;
        is $o.height, 600;
        is $o.time, "(unknown)";
    }
    elsif $image eq "joe1.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 224;
        is $o.height, 300;
        is $o.time, "(unknown)";
    }
    elsif $image eq "knuth.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 190;
        is $o.height, 266;
        is $o.time, "(unknown)";
    }
    elsif $image eq "lamport.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 199;
        is $o.height, 253;
        is $o.time, "(unknown)";
    }
    elsif $image eq "petr_vanek.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 65;
        is $o.height, 71;
        is $o.time, "(unknown)";
    }
    elsif $image eq "picard_yes.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 400;
        is $o.height, 400;
        is $o.time, "(unknown)";
    }
    elsif $image eq "plato-aristotle.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 800;
        is $o.height, 1047;
        is $o.time, "(unknown)";
    }
    elsif $image eq "shane1.jpg" {
        is $o.image.IO.basename, $image;
        is $o.width, 220;
        is $o.height, 300;
        is $o.time, "(unknown)";
    }
}

done-testing;
