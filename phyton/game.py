#!/usr/bin/env python3

# Tic Tac Toe by zkjon (versión Python)

import os
import sys

# Constantes
EMPTY = " "
PLAYER_X = "X"
PLAYER_O = "O"

# Inicializar el tablero
board = [EMPTY] * 9

# Mostrar el tablero
def print_board():
    print()
    print(f" {board[0]} | {board[1]} | {board[2]}      1 | 2 | 3")
    print("---+---+---    ---+---+---")
    print(f" {board[3]} | {board[4]} | {board[5]}      4 | 5 | 6")
    print("---+---+---    ---+---+---")
    print(f" {board[6]} | {board[7]} | {board[8]}      7 | 8 | 9")
    print()

# Verificar si alguien ganó
def check_winner():
    win_patterns = [
        (0, 1, 2),
        (3, 4, 5),
        (6, 7, 8),
        (0, 3, 6),
        (1, 4, 7),
        (2, 5, 8),
        (0, 4, 8),
        (2, 4, 6),
    ]
    for i, j, k in win_patterns:
        if board[i] != EMPTY and board[i] == board[j] == board[k]:
            print_board()
            print(f"Player {board[i]} wins! Congratulations!")
            sys.exit(0)

# Verificar empate
def check_draw():
    if EMPTY not in board:
        print_board()
        print("It's a draw!")
        sys.exit(0)

# Validar entrada
def validate_input(input_str):
    if not input_str.isdigit() or not (1 <= int(input_str) <= 9):
        print("Invalid input. Please enter a number between 1 and 9.")
        return False
    idx = int(input_str) - 1
    if board[idx] != EMPTY:
        print("Cell already taken. Please choose another cell.")
        return False
    return True

# Bucle principal del juego
current_player = PLAYER_X
while True:
    os.system('clear' if os.name == 'posix' else 'cls')
    print(f"Tic Tac Toe - Player {current_player}'s turn")
    print_board()

    while True:
        move = input("Choose a cell (1-9): ").strip()
        if validate_input(move):
            break

    index = int(move) - 1
    board[index] = current_player

    check_winner()
    check_draw()

    current_player = PLAYER_O if current_player == PLAYER_X else PLAYER_X