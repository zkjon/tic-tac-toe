package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// Game constants
const (
	EMPTY    = " "
	PLAYER_X = "X"
	PLAYER_O = "O"
)

// ANSI escape code to clear the screen
const clearScreen = "\033[H\033[2J"

func main() {
	// Initialize the board with empty spaces
	board := []string{EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY}
	currentPlayer := PLAYER_X
	scanner := bufio.NewScanner(os.Stdin)

	for {
		// Clear screen and display game state
		fmt.Print(clearScreen)
		fmt.Printf("Tic Tac Toe - Player %s's turn\n", currentPlayer)
		printBoard(board)

		// Get player move
		move := getValidMove(scanner, board)
		
		// Update board
		index := move - 1
		board[index] = currentPlayer

		// Check for winner
		if hasWinner(board) {
			fmt.Print(clearScreen)
			printBoard(board)
			fmt.Printf("Player %s wins! Congratulations!\n", currentPlayer)
			break
		}

		// Check for draw
		if isDraw(board) {
			fmt.Print(clearScreen)
			printBoard(board)
			fmt.Println("It's a draw!")
			break
		}

		// Switch player
		if currentPlayer == PLAYER_X {
			currentPlayer = PLAYER_O
		} else {
			currentPlayer = PLAYER_X
		}
	}
}

// printBoard displays the current state of the board
func printBoard(board []string) {
	fmt.Println()
	fmt.Printf(" %s | %s | %s      1 | 2 | 3\n", board[0], board[1], board[2])
	fmt.Println("---+---+---    ---+---+---")
	fmt.Printf(" %s | %s | %s      4 | 5 | 6\n", board[3], board[4], board[5])
	fmt.Println("---+---+---    ---+---+---")
	fmt.Printf(" %s | %s | %s      7 | 8 | 9\n", board[6], board[7], board[8])
	fmt.Println()
}

// hasWinner checks if any player has won
func hasWinner(board []string) bool {
	// All possible winning patterns
	winPatterns := [][]int{
		{0, 1, 2}, // top row
		{3, 4, 5}, // middle row
		{6, 7, 8}, // bottom row
		{0, 3, 6}, // left column
		{1, 4, 7}, // middle column
		{2, 5, 8}, // right column
		{0, 4, 8}, // diagonal from top-left
		{2, 4, 6}, // diagonal from top-right
	}

	for _, pattern := range winPatterns {
		a, b, c := pattern[0], pattern[1], pattern[2]
		if board[a] != EMPTY && board[a] == board[b] && board[a] == board[c] {
			return true
		}
	}
	return false
}

// isDraw checks if the game is a draw
func isDraw(board []string) bool {
	for _, cell := range board {
		if cell == EMPTY {
			return false
		}
	}
	return true
}

// getValidMove prompts the user for a valid move
func getValidMove(scanner *bufio.Scanner, board []string) int {
	for {
		fmt.Print("Choose a cell (1-9): ")
		scanner.Scan()
		input := strings.TrimSpace(scanner.Text())
		
		move, err := strconv.Atoi(input)
		if err != nil || move < 1 || move > 9 {
			fmt.Println("Invalid input. Please enter a number between 1 and 9.")
			continue
		}
		
		index := move - 1
		if board[index] != EMPTY {
			fmt.Println("Cell already taken. Please choose another cell.")
			continue
		}
		
		return move
	}
}

