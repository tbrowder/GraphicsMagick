#!/usr/bin/env raku

my $dir = "./jpg";
my $pic-list = "pics.list";

my %pics;
for $pic-list.IO.lines -> $pic {
    next if $pic !~~ /\S/;
    my $fname = $pic.IO.basename;

    while %pics{$fname}:exists {
        say "Dup pic $fname";
        my ($stem, $suff) = split '.', $fname;
        if $stem ~~ /(\d+)/ {
            my $num = +$0;
            ++$num;     
            $stem ~~ s/\d+$/$num/;
        }
        else {
            $stem ~= 2;
        }
        $fname = $stem ~ '.' ~ $suff;
        say "  new name: $fname";
    }
    %pics{$fname} = $pic;
}
for %pics.kv -> $pic, $src {
    copy $src, "./jpg/$pic";
}

