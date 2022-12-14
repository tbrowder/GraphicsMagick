use Test;
use GraphicsMagick;

my $res;
my @lines; 
my $pic = get-test-image;

lives-ok { 
    $res = run('raku', '-Ilib', './bin/crop', :out).out.slurp;
    for $res.lines -> $line {
        next if $line !~~ /\S/;
        like $line, /^ Usage ': ' /;
        last;
    }
}

lives-ok { 
    try {
        $res = run('raku', '-Ilib', "./bin/crop", "show", "$pic", :out).out.slurp 
    }
};

lives-ok { 
    try {
        $res = run('raku', '-Ilib', "./bin/crop", "show", "$pic", :out).out.slurp 
    }
};

done-testing;
