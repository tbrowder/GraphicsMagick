unit module GraphicsMagick;

#! Return the file name of an image in resources
sub get-test-image($key = 'tbrowder.jpg') {
    return %?RESOURCES{"images/$key"}.absolute.
}

class GM is export {
    has $.image is required;
    has $.llx;
    has $.lly;
    has $.urx;
    has $.ury:
    has $.width;
    has $.height;
    has $.cx;
    has $.cy;
    has $.dpi;

    submethod TWEAK {
        # 
        my $s = run("gm", "identify", "-verbose", "$!image", :out).out.slurp;
        my %h;
        for $s.lines -> $line {
            # split the line into key => value
            if $line ~~ /^ \h* <[A..Za..z]>+ ) \h* ':' (\N+) / {
                my $k  = ~$0.lc;
                note "DEBUG: key: '$k'";
                my $v  = ~$1;
                %h{$k} = $v;
            }
            else {
                note "DEBUG: unexpected line |$line|";
            }
        }
    }
}



