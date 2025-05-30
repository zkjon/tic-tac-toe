#!/usr/bin/env ruby
# game.rb
# Main game class for Tic-tac-toe

require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
    @scores = { 'X' => 0, 'O' => 0, 'Draw' => 0 }
  end

  # Start the game
  def start
    display_welcome_message
    play_game
  end

  # Main game loop
  def play_game
    loop do
      @board.display
      play_turn
      
      if @board.game_over?
        @board.display
        handle_game_over
        break unless play_again?
        reset_game
      end
    end
    
    display_goodbye_message
  end

  private

  # Display welcome message and instructions
  def display_welcome_message
    system('clear') || system('cls')
    puts "====================================="
    puts "    WELCOME TO TIC-TAC-TOE RUBY     "
    puts "====================================="
    puts "\nInstructions:"
    puts "1. Players take turns placing their mark (X or O) on the board"
    puts "2. Enter the row and column (0-2) to place your mark"
    puts "3. First player to get 3 in a row, column, or diagonal wins"
    puts "4. If the board is full with no winner, it's a draw"
    puts "\nPress Enter to start..."
    gets
  end

  # Handle a player's turn
  def play_turn
    puts "Player #{@current_player}'s turn"
    
    loop do
      row, col = get_move
      
      if @board.place_marker(row, col, @current_player)
        switch_player
        break
      else
        puts "Invalid move! The cell is either occupied or out of bounds."
      end
    end
  end

  # Get the player's move
  def get_move
    loop do
      print "Enter row and column (e.g., '1 2'): "
      input = gets.chomp
      
      # Check for quit command
      exit if input.downcase == 'quit' || input.downcase == 'exit'
      
      # Parse the input
      match = input.match(/^\s*(\d)\s+(\d)\s*$/)
      
      if match
        row, col = match[1].to_i, match[2].to_i
        if @board.valid_position?(row, col)
          return [row, col] if @board.position_empty?(row, col)
          puts "That position is already taken!"
        else
          puts "Invalid position! Row and column must be between 0 and 2."
        end
      else
        puts "Invalid input! Please enter row and column as two numbers separated by a space."
      end
    end
  end

  # Switch to the other player
  def switch_player
    @current_player = (@current_player == 'X') ? 'O' : 'X'
  end

  # Handle game over (win or draw)
  def handle_game_over
    winner = @board.winner
    
    if winner
      puts "Player #{winner} wins!"
      @scores[winner] += 1
    else
      puts "It's a draw!"
      @scores['Draw'] += 1
    end
    
    display_scores
  end

  # Display the current scores
  def display_scores
    puts "\nScores:"
    puts "Player X: #{@scores['X']}"
    puts "Player O: #{@scores['O']}"
    puts "Draws: #{@scores['Draw']}"
  end

  # Ask if players want to play again
  def play_again?
    print "\nDo you want to play again? (y/n): "
    answer = gets.chomp.downcase
    answer == 'y' || answer == 'yes'
  end

  # Reset the game for a new round
  def reset_game
    @board.reset
    @current_player = 'X'
    system('clear') || system('cls')
  end

  # Display goodbye message
  def display_goodbye_message
    puts "\nThanks for playing Tic-tac-toe!"
    puts "Final Scores:"
    display_scores
    puts "\nGoodbye!"
  end
end

# Start the game if this script is executed directly
if __FILE__ == $PROGRAM_NAME
  Game.new.start
end

