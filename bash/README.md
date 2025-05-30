# Bash Tic-tac-toe

A shell script implementation of the classic Tic-tac-toe game.

## Description

This is a Bash shell script implementation of the classic Tic-tac-toe game. It uses terminal-based ASCII graphics and shell commands to create an interactive gaming experience directly in your terminal.

## Features

- Pure Bash implementation with no external dependencies
- Terminal-based ASCII graphics
- Two-player gameplay
- Score tracking between games
- Compatible with most Unix-like terminals
- Portable across Linux, macOS, and Unix systems

## Requirements

- Bash shell version 4.0 or higher
- A terminal with ANSI color support
- Standard Unix utilities (echo, read, etc.)

## Installation

No installation is required! The game runs directly from the shell script.

### Make the Script Executable

Before playing, you'll need to make the script executable:

```bash
chmod +x game.sh
```

## How to Play

1. Navigate to the bash directory:
   ```bash
   cd bash
   ```

2. Run the game:
   ```bash
   ./game.sh
   ```

3. Follow the on-screen instructions:
   - The game board is a 3x3 grid with positions numbered 1-9
   - Players take turns entering a position number to place their mark
   - The first player to get three in a row (horizontally, vertically, or diagonally) wins
   - If all positions are filled with no winner, the game ends in a draw

4. To quit the game at any time, press Ctrl+C

## Terminal Compatibility Notes

- The game uses ANSI escape sequences for colors and cursor positioning
- For best experience, use a terminal with ANSI color support
- Tested on:
  - Linux terminals (GNOME Terminal, Konsole, xterm)
  - macOS Terminal and iTerm2
  - Git Bash on Windows
  - WSL (Windows Subsystem for Linux)

- Terminal size: Requires at least 80x24 characters for proper display
- If playing on Windows, use Git Bash, WSL, or other Bash-compatible environment

## Shell Script Features Demonstrated

- Array manipulation
- Functions and control structures
- ANSI escape sequences for terminal control
- Input validation
- Game state management
- Clean exit handling

## Contributing

Feel free to submit improvements or bug fixes by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

