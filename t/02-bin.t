use Test;
use GraphicsMagick::Utils;

my $res;
my @lines; 
my $pic = get-test-image;

lives-ok { 
    $res = run('raku', '-Ilib', './bin/photo', :out).out.slurp;
    for $res.lines -> $line {
        next if $line !~~ /\S/;
        like $line, /^ Usage ': ' /;
        last;
    }
}

lives-ok { 
    try {
        $res = run('raku', '-Ilib', "./bin/photo", "show", "$pic", :out).out.slurp 
    }
};

lives-ok { 
    try {
        $res = run('raku', '-Ilib', "./bin/photo", "crop", "$pic", :out).out.slurp 
    }
};

done-testing;
