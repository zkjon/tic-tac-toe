# Python Tic-tac-toe

A clean implementation of the classic Tic-tac-toe game written in Python.

## Description

This is a Python implementation of the classic Tic-tac-toe game. It provides a simple yet engaging command-line gaming experience with clean, readable code that demonstrates Python best practices.

## Features

- Clean command-line interface with colored output
- Two-player gameplay
- Input validation and error handling
- Score tracking between games
- Configurable board size (default 3x3)
- Option to play against a simple AI opponent
- Cross-platform compatibility

## Requirements

- Python 3.6 or higher
- No external dependencies (uses only the Python standard library)

## Installation

1. Ensure you have Python 3.6+ installed:
   ```bash
   python --version
   # OR
   python3 --version
   ```
   
   If Python is not installed, download it from [python.org](https://www.python.org/downloads/)

2. No additional installation is needed - Python's standard library contains everything required

## How to Play

1. Navigate to the python directory:
   ```bash
   cd python
   ```

2. Run the game:
   ```bash
   python game.py
   # OR 
   python3 game.py
   ```
   
   On Windows, you might also use:
   ```
   py game.py
   ```

3. Follow the on-screen instructions:
   - The game board is a 3x3 grid with positions numbered 1-9
   - Players take turns entering a position number to place their mark
   - The first player to get three in a row (horizontally, vertically, or diagonally) wins
   - If all positions are filled with no winner, the game ends in a draw

4. To quit the game at any time, press Ctrl+C or type 'quit' when prompted for input

## Project Structure

```
python/
├── game.py      # Main game module
├── board.py     # Board class and logic
├── player.py    # Player classes (human and AI)
├── utils.py     # Utility functions
└── README.md    # This file
```

## Python-Specific Features

- Object-oriented design with clear class responsibilities
- Type hints for better code readability and IDE support
- Docstrings following PEP 257 conventions
- PEP 8 compliant code style
- Error handling with appropriate exceptions
- Clean, modular architecture

## Contributing

Feel free to submit improvements or bug fixes by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

