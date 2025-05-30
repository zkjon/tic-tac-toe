# Assembly Tic-tac-toe

A low-level implementation of the classic Tic-tac-toe game written in Assembly.

## Description

This is an Assembly implementation of the classic Tic-tac-toe game. It demonstrates how to create a complete interactive game using low-level programming techniques.

## Features

- Console-based interface
- Two-player gameplay
- Efficient memory usage
- Direct hardware interaction
- Demonstrates low-level programming concepts

## Requirements

- NASM (Netwide Assembler) 2.14 or higher
- A linker (ld on Linux, link.exe on Windows)
- For Windows: MinGW or similar environment
- For Linux: Build-essential package

## Installation

### Linux

1. Install NASM and build tools:
   ```bash
   sudo apt-get update
   sudo apt-get install nasm build-essential
   ```

### Windows

1. Install NASM from [NASM website](https://www.nasm.us/)
2. Add NASM to your PATH
3. Install MinGW or similar development environment

## Building

1. Assemble the source file:
   ```bash
   nasm -f elf64 -o tictactoe.o tictactoe.asm  # Linux
   # OR
   nasm -f win64 -o tictactoe.obj tictactoe.asm  # Windows
   ```

2. Link the object file:
   ```bash
   ld -o tictactoe tictactoe.o  # Linux
   # OR
   link tictactoe.obj /subsystem:console  # Windows with Microsoft linker
   ```

## How to Play

1. Run the executable:
   ```bash
   ./tictactoe  # Linux
   # OR
   tictactoe.exe  # Windows
   ```

2. Follow the on-screen instructions:
   - The game board is a 3x3 grid with positions numbered 1-9
   - Players take turns entering a position number to place their mark
   - The first player to get three in a row wins
   - If all positions are filled with no winner, the game ends in a draw

## Assembly-Specific Notes

- This implementation uses minimal library calls for better understanding of low-level concepts
- Input/output is handled through syscalls on Linux or interrupt calls on Windows
- Memory management is done manually
- The code demonstrates efficient bit manipulation techniques
- Board state is stored in a compact binary representation
- No external dependencies are required beyond the OS

## Contributing

Feel free to submit improvements or bug fixes by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

