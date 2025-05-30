# Ruby Tic-tac-toe

A command-line implementation of the classic Tic-tac-toe game written in Ruby.

## Description

This is a Ruby implementation of the classic Tic-tac-toe game (also known as Noughts and Crosses). Two players take turns marking spaces on a 3×3 grid with the objective of placing three of their marks in a horizontal, vertical, or diagonal row.

## Features

- Clean command-line interface with visual board representation
- Two-player gameplay
- Input validation to prevent invalid moves
- Score tracking between games
- Option to play multiple games in succession
- Clear instructions and feedback

## Requirements

- Ruby 2.0+ (should work with most Ruby versions)
- No external dependencies required

## Installation

1. Ensure you have Ruby installed on your system
   ```
   ruby --version
   ```
   
   If Ruby is not installed, download and install it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/)

2. No additional installation is needed - Ruby standard library contains everything required

## How to Play

1. Navigate to the ruby directory:
   ```
   cd ruby
   ```

2. Make the game script executable (Unix/Linux/macOS):
   ```
   chmod +x game.rb
   ```

3. Run the game:
   ```
   ruby game.rb
   ```
   or directly (if executable):
   ```
   ./game.rb
   ```

4. Follow the on-screen instructions:
   - The game board is a 3x3 grid with coordinates from 0 to 2
   - Enter the row and column to place your mark (e.g., "1 2")
   - The first player uses 'X', and the second player uses 'O'
   - The first player to get three in a row (horizontally, vertically, or diagonally) wins
   - If the board fills up with no winner, the game ends in a draw

5. To quit the game at any time, type 'quit' or 'exit'

## Code Structure

- `game.rb` - Main game class with game loop and player management
- `board.rb` - Board class to handle the game board state and moves

## Contributing

Feel free to submit improvements or bug fixes by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

