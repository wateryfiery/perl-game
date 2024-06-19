#!/usr/bin/perl -w  
use Tk;
use strict;
 
my $mw = MainWindow->new;
$mw->title('Playing around with Tkinter');

my $canvas = $mw->Canvas(
  -width => 400,
  -height => 400,
  -background => 'white'
)->pack;
my $square_size = 50;
my $square = $canvas->createRectangle(175, 175, 175 + $square_size, 175 + $square_size,
  -fill => 'steelblue'
);

sub moveSquare {
  my ($direction) = @_;

  my ($x1, $y1, $x2, $y2) = $canvas->coords($square);
  if ($direction eq 'Left') { $canvas->move($square, -10, 0) if $x1 > 0;  }
  elsif ($direction eq 'Right') { $canvas->move($square, 10, 0) if $x2 < 400; }
  elsif ($direction eq 'Up') { $canvas->move($square, 0, -10) if $y1 > 0; }
  elsif ($direction eq 'Down') { $canvas->move($square, 0, 10) if $y2 < 400; }
};

$mw->bind('<Left>', sub { moveSquare('Left') });
$mw->bind('<Right>', sub { moveSquare('Right') });
$mw->bind('<Up>', sub { moveSquare('Up') });
$mw->bind('<Down>', sub { moveSquare('Down') });


=pod
my $label = $mw->Label(-text => 'Enter something')->pack;
my $input = $mw->Entry()->pack;
my $label2 = $mw->Label()->pack;
my $input_text;
my  $btn1;
my  $btn2;

$btn1 = $mw->Button(
  -text => 'red button',
  -background  => 'red',
  -command => sub {
    $btn2->configure(-text => 'done');
    $input_text = $input->get();
    $label2->configure(-text => $input_text);
  }
)->pack;

$btn2 = $mw->Button(
    -text    => 'Quit',
    -command => sub { exit },
)->pack;
=cut
MainLoop;
