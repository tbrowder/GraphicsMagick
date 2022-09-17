unit module GraphicsMagick::Utils;

=begin comment
#my $str = run('some prog', :out).out.slurp;
my $str = run("gm", :out).out.slurp;
say $str;
=end comment

sub gm-run-cmd($cmd, :$img!, :$option, :$debug) is export {

}

sub gm-commands(:$debug) is export {
    my $str = run("gm", :out).out.slurp;
    $str
}

sub gm-cmd-help($cmd, :$debug) is export {
    with $cmd {
        when ~~ // { 
    }

}



