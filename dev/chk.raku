use Text::Utils :ALL;

my $f = "./identity.lines";
for $f.IO.lines -> $line {
    say $line;
    my $n = count-substrs $line, ':';
    say "  $n colons" if $n;
}


