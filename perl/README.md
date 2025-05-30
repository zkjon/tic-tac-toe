# Perl Tic-tac-toe

A classic Tic-tac-toe game implemented in Perl.

## Description

This is a Perl implementation of the classic Tic-tac-toe game. It demonstrates Perl's text processing capabilities and pattern matching to create an interactive command-line game.

## Features

- Command-line interface with ASCII graphics
- Two-player gameplay
- Input validation using regular expressions
- Game state tracking
- Score persistence between games
- Cross-platform compatibility

## Requirements

- Perl 5.10 or higher
- Standard Perl modules only (no external dependencies)

## Installation

1. Ensure you have Perl installed:
   ```bash
   perl -v
   ```
   If Perl is not installed:
   - Windows: Download from [Strawberry Perl](http://strawberryperl.com/) or [ActiveState Perl](https://www.activestate.com/products/perl/)
   - Linux: Usually pre-installed, or use `sudo apt-get install perl` (Debian/Ubuntu)
   - macOS: Pre-installed

2. No additional installation needed - Perl's standard library includes everything required

## How to Play

1. Navigate to the perl directory:
   ```bash
   cd perl
   ```

2. Make the script executable (Unix/Linux/macOS):
   ```bash
   chmod +x game.pl
   ```

3. Run the game:
   ```bash
   perl game.pl
   ```
   Or directly if executable:
   ```bash
   ./game.pl
   ```

4. Follow the on-screen instructions:
   - The game board is a 3x3 grid with positions numbered 1-9
   - Players take turns entering a position number to place their mark
   - The first player to get three in a row (horizontally, vertically, or diagonally) wins
   - If all positions are filled with no winner, the game ends in a draw

## Module Dependencies

This implementation uses only core Perl modules:
- `strict` and `warnings` - For better code quality
- `Term::ANSIColor` (core since Perl 5.6) - For colored output
- `Scalar::Util` - For additional utility functions
- No CPAN modules required

## Perl-Specific Notes

- Uses Perl's powerful regular expressions for input validation
- Demonstrates Perl's hash and array handling capabilities
- Shows Perl's string manipulation strengths
- Uses Perl's reference system for data structures
- Written in a maintainable, modern Perl style
- Compatible with both Unix and Windows environments
- Employs defensive programming techniques common in Perl applications

## Contributing

Feel free to submit improvements or bug fixes by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

