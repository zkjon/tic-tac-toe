#!/bin/bash

# Tic Tac Toe by zkjon

set -euo pipefail

# Constants
readonly EMPTY=" "
readonly PLAYER_X="X"
readonly PLAYER_O="O"

# Initialize the board with empty spaces
board=("$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY" "$EMPTY")

# Function to display the board
print_board() {
  echo ""
  echo " ${board[0]} | ${board[1]} | ${board[2]}      1 | 2 | 3"
  echo "---+---+---    ---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]}      4 | 5 | 6"
  echo "---+---+---    ---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]}      7 | 8 | 9"
  echo ""
}

# Function to check if a player has won
check_winner() {
  local win_patterns=(
    "0 1 2"
    "3 4 5"
    "6 7 8"
    "0 3 6"
    "1 4 7"
    "2 5 8"
    "0 4 8"
    "2 4 6"
  )
  for pattern in "${win_patterns[@]}"; do
    set -- $pattern
    if [[ "${board[$1]}" != "$EMPTY" && "${board[$1]}" == "${board[$2]}" && "${board[$1]}" == "${board[$3]}" ]]; then
      print_board
      echo "Player ${board[$1]} wins! Congratulations!"
      exit 0
    fi
  done
}

# Function to check for a draw
check_draw() {
  for cell in "${board[@]}"; do
    if [[ "$cell" == "$EMPTY" ]]; then
      return
    fi
  done
  print_board
  echo "It's a draw!"
  exit 0
}

# Function to validate input
validate_input() {
  local input="$1"
  if ! [[ "$input" =~ ^[1-9]$ ]]; then
    echo "Invalid input. Please enter a number between 1 and 9."
    return 1
  fi
  local idx=$((input - 1))
  if [[ "${board[$idx]}" != "$EMPTY" ]]; then
    echo "Cell already taken. Please choose another cell."
    return 1
  fi
  return 0
}

# Main game loop
current_player="$PLAYER_X"
while true; do
  clear
  echo "Tic Tac Toe - Player $current_player's turn"
  print_board

  move=""
  while true; do
    read -rp "Choose a cell (1-9): " move
    if validate_input "$move"; then
      break
    fi
  done

  index=$((move - 1))
  board[$index]=$current_player

  check_winner
  check_draw

  # Switch player
  if [[ "$current_player" == "$PLAYER_X" ]]; then
    current_player="$PLAYER_O"
  else
    current_player="$PLAYER_X"
  fi
done