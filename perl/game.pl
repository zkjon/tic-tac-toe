#!/usr/bin/perl

# Tic Tac Toe by zkjon

use strict;
use warnings;

# Constants
use constant {
    EMPTY    => ' ',
    PLAYER_X => 'X',
    PLAYER_O => 'O',
};

# Initialize the board with empty spaces
my @board = (EMPTY) x 9;

# Function to display the board
sub print_board {
  print "\n";
  print " $board[0] | $board[1] | $board[2]      1 | 2 | 3\n";
  print "---+---+---    ---+---+---\n";
  print " $board[3] | $board[4] | $board[5]      4 | 5 | 6\n";
  print "---+---+---    ---+---+---\n";
  print " $board[6] | $board[7] | $board[8]      7 | 8 | 9\n";
  print "\n";
}

# Function to pause before exiting
sub pause_before_exit {
    print "\nPress Enter to exit...";
    <STDIN>;
    exit 0;
}

# Function to check if a player has won
sub check_winner {
  my @win_patterns = (
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6],
  );
  for my $pattern (@win_patterns) {
    my ($a, $b, $c) = @$pattern;
    if ($board[$a] ne EMPTY && $board[$a] eq $board[$b] && $board[$a] eq $board[$c]) {
      print_board();
      print "Player $board[$a] wins! Congratulations!\n";
      pause_before_exit();
    }
  }
}


# Function to check for a draw
sub check_draw {
  for my $cell (@board) {
    if ($cell eq EMPTY) {
      return;
    }
  }
  print_board();
  print "It's a draw!\n";
  pause_before_exit();
}


# Function to validate input
sub validate_input {
  my ($input) = @_;
  if ($input !~ /^[1-9]$/) {
    print "Invalid input. Please enter a number between 1 and 9.\n";
    return 0;
  }
  my $idx = $input - 1;
  if ($board[$idx] ne EMPTY) {
    print "Cell already taken. Please choose another cell.\n";
    return 0;
  }
  return 1;
}

# Main game loop
my $current_player = PLAYER_X;
while (1) {
  system("cls");
  print "Tic Tac Toe - Player $current_player's turn\n";
  print_board();

  my $move = "";
  while (1) {
    print "Choose a cell (1-9): ";
    chomp($move = <STDIN>);
    if (validate_input($move)) {
      last;
    }
  }

  my $index = $move - 1;
  $board[$index] = $current_player;

  check_winner();
  check_draw();

  # Switch player
  if ($current_player eq PLAYER_X) {
    $current_player = PLAYER_O;
  } else {
    $current_player = PLAYER_X;
  }
}
 