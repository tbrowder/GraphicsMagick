unit module GraphicsMagick::Utils;

sub get-test-image($key = 'knuth.jpg') is export {
    %?RESOURCES{"images/$key"}.absolute;
}

=begin comment
#my $str = run('some prog', :out).out.slurp;
my $str = run("gm", :out).out.slurp;
say $str;
=end comment

sub gm-run-cmd($cmd, :$img!, :$option, :$debug) is export {
    my $res;
    if $cmd eq "display" {
        $res = run("gm", $cmd, $img, :out).out.slurp;
        return if $res.contains("gm display: Unable to open X server");
    }
    $res
}

sub gm-commands(:$debug) is export {
    my $str = run("gm", :out).out.slurp;
    $str
}

sub gm-cmd-help($cmd, :$debug) is export {
    with $cmd {
        when $cmd ~~ /3/ {
        }
    }

}
