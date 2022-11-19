unit class GraphicsMagick::GM is export;

use Text::Utils :normalize-string;
use LocalTime;
use GraphicsMagick::Utils;

has $.image is required;
has $.debug is rw = 0;
has $.width;
has $.height;
has $.x = 0; # top left is origin
has $.y = 0; # top left is origin

has $.dpi;
has %.attributes;
has LocalTime $.localtime;

# cropping params set by setter methods
has $.c-width  = 100;
has $.c-height = 100;
has $.c-x;
has $.c-y;
has $.c-color = "white";
has $.c-border = 2;

# other attrs to be set
has $.name;
has $.force = 0;
has $.to-dir = '.';

method display {
    gm-run-cmd("display", :img($!image));
}

method time {
    self.localtime.defined ?? self.localtime.Str !! "(unknown)"
}
method basename {
    self.image.IO.basename
}
method set-crop($arg, :$val!) {
    with $arg {
        when /^w/ {
            $!c-width = $val;
        }
        when /^h/ {
            $!c-height = $val;
        }
        when /^x/ {
            $!c-x = $val;
        }
        when /^y/ {
            $!c-y = $val;
        }
        when /^c/ {
            $!c-color = $val;
        }
        when /^b/ {
            $!c-border = $val;
        }
        default {
            die "FATAL: Unknown set-crop arg '$_'";
        }
    }
}

submethod TWEAK {
    my $s = run('gm', 'identify', '-verbose', "$!image", :out).out.slurp;
    my %h =[];
    for $s.lines -> $line {
        # split the line into key => value
        if $line ~~ /^ \h* ( <-[:]>+ ) \h* ':' (\N+)? $/ {
            my $k = ~$0;
            $k = normalize-string $k;
            #next if $k eq 'Maker Note';
            #next if $k eq 'Components Configuration';

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
            note "DEBUG: unexpected line |$line|" if $!debug;
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
    # assign all to the object
    %!attributes = %h;
    # set default cropping values
    my $hw = $!width * 0.5;
    my $hh = $!height * 0.5;
    my $x = $!width < 100 ?? 0 !! ($hw - 50);
    my $y = $!height < 100 ?? 0 !! ($hh - 50);

    self.set-crop('x', :val($x));
    self.set-crop('y', :val($y));

} # submethod TWEAK

method show(:$all) {
    print qq:to/HERE/;
    Input image: {self.image}
      basename:        {self.image.IO.basename}
      time:            {self.time}
      width (pixels):  {self.width}
      height (pixels): {self.height}
    HERE

    if $all {
        say "All attributes:";
        my @attrs = %!attributes.keys.sort;
        my $len = 0;
        for @attrs -> $a {
            my $n = $a.chars;
            $len = $n if $n > $len;
        }

        for @attrs -> $a {
            my $v = %!attributes{$a};
            say sprintf("  %-*.*s: %-s", $len, $len, $a, $v):
        }
    }
} # submethod TWEAK

# my $s = run("gm", "identify", "-verbose", "$!image", :out).out.slurp;
method execute {
}
method crop {
}
