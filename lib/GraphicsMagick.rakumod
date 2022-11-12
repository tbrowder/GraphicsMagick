unit module GraphicsMagick;

use Text::Utils :normalize-string;
use LocalTime;

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
    has LocalTime $.localtime;

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
        my $gk = 'Geometry';
        if %h{$gk}:exists {
            my $t = %h{$gk};
            if $t ~~ /^ (\d+) 'x' (\d+) $/ {
                $!width  = +$0;
                $!height = +$1;
            }
            else { die "FATAL: Unknown value format"; }
        }

        my $dk = 'Date Time';
        if %h{$dk}:exists {
            # format: Date Time: 2014:07:12 06:03:44
            my $t = %h{$dk};
            if $t.defined and $t ~~ /^ 
                         \h*
                         (\d**4) ':' (\d\d) ':' (\d\d)     # $0 $1 $2
                         \h+
                         (\d**2) ':' (\d\d) ':' (\d\d)     # $3 $4 $5
                         \h*
                     $/ {
                # assume the date and time are local in our timezone
                my $year   = +$0;
                my $month  = +$1;
                my $day    = +$2;
                my $hour   = +$3;
                my $minute = +$4;
                my $second = +$5;

                $!localtime = LocalTime.new: :$year, :$month, :$day, :$hour, :$minute, :$second;
                if $!debug {
                    note qq:to/HERE/;
                    DEBUG: input time: $!localtime
                    HERE
                }
            }
            else { die "FATAL: Unknown value format: |$s|"; }
        }
    }
}

