#!/usr/bin/env raku

use GTK::Simple;

use lib "../lib";
use GraphicsMagick::Utils;

my $image = get-test-image;

use GTK::Simple::App;
use GTK::Simple::Frame;
use GTK::Simple::TextView;
use GTK::Simple::VBox;

my $app        = GTK::Simple::App.new(:title("Frame Demo"));
my $text-view  = GTK::Simple::TextView.new(:text("Some Text"));
my $frame      = GTK::Simple::Frame.new(:label("Some Picture"));
my $vbox       = GTK::Simple::VBox.new("$image");
$text-view.text = q:to/SAMPLE/;
    This is some lines of text to show alignment of box
    All the lines should be aligned RIGHT
    Default for a TextView is align CENTER
    Also possible are LEFT and FILL
    SAMPLE
$text-view.alignment = RIGHT;
$vbox.border-width = 20;
$frame.set-content( $vbox );
$app.set-content( $frame );
$app.border-width = 20;

$app.run;
