unit module GraphicsMagick;

use Text::Utils :normalize-string;

sub get-test-image($key = 'tbrowder.jpg') is export {
    $?DISTRIBUTION.content("resources/images/$key").IO.absolute;
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
    has $.debug is rw = 0;

    submethod TWEAK {
        # 
        my $s = run("gm", "identify", "-verbose", "$!image", :out).out.slurp;
        my %h;
        for $s.lines -> $line {
            # split the line into key => value
            if $line ~~ /^ \h* ( <-[:]>+ ) \h* ':' (\N+) / {
                my $k = ~$0.lc;
                $k = normalize-string $k;
                note "DEBUG: key: '$k'" if $!debug;
                my $v  = ~$1;
                %h{$k} = $v;
            }
            else {
                note "DEBUG: unexpected line |$line|";
            }
        }
        # assign the desired keys to the appropriate attribute
    }
}



