unit module GraphicsMagick;

use Text::Utils :normalize-string;

sub get-test-image($key = 'tbrowder.jpg') is export {
    $?DISTRIBUTION.content("resources/images/$key").IO.absolute;
}

class GM is export {
    has $.image is required;
    has $.debug is rw = 0;
    has $.width;
    has $.height;
    has $.llx = 0;
    has $.lly = 0;

    has $.urx;
    has $.ury:
    has $.cx;
    has $.cy;
    has $.dpi;

    submethod TWEAK {
        # 
        my $s = run("gm", "identify", "-verbose", "$!image", :out).out.slurp;
        my %h =[];
        for $s.lines -> $line {

            # split the line into key => value
            if $line ~~ /^ \h* ( <-[:]>+ ) \h* ':' (\N+)? $/ {
                my $k = ~$0;
                $k = normalize-string $k;
                next if $k eq 'Maker Note';
                next if $k eq 'Components Configuration';

                if $1.defined {
                    my $v  = ~$1;
                    $v = normalize-string $v;
                    note "DEBUG: key: '$k', value: '$v'" if $!debug;
                    %h{$k} = $v;
                }
                else {
                    note "DEBUG: key: '$k' ===>" if $!debug;
		    %h{$k} = '';
                }
            }
            else {
                note "DEBUG: unexpected line |$line|";
            }
        }

        # assign the desired keys to the appropriate attribute
        if %h{'Geometry'}:exists {
            my $t = %h<Geometry>;
            if $t ~~ /^ (\d+) 'x' (\d+) $/ {
                $!width  = +$0;
                $!height = +$1;
            }
            else { die "FATAL: Unknown value format"; }
        }
        if %h{'Date Time'}:exists {
            # format: Date Time: 2014:07:12 06:03:44
            my $t = %h{'Date Time'};
            if $t.defined and $t ~~ /^ 
                         \h*
                         (\w**4 ':' \w\w ':' \w\w)     # $0
                         \h+
                         (\w**2 ':' \w\w ':' \w\w)     # $1
                         \h*
                     $/ {
                my $date = ~$0;
                my $time = ~$1;
            }
            else { die "FATAL: Unknown value format: |$s|"; }
        }
    }
}



