# board.rb
# Represents the Tic-tac-toe game board

class Board
  attr_reader :grid

  def initialize
    # Create a 3x3 grid with empty cells (nil)
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  # Place a marker (X or O) at the specified position
  def place_marker(row, col, marker)
    return false unless valid_position?(row, col)
    return false unless @grid[row][col].nil?
    
    @grid[row][col] = marker
    true
  end

  # Check if a position is valid (within the board boundaries)
  def valid_position?(row, col)
    row.between?(0, 2) && col.between?(0, 2)
  end

  # Check if a position is empty
  def position_empty?(row, col)
    return false unless valid_position?(row, col)
    @grid[row][col].nil?
  end

  # Reset the board for a new game
  def reset
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  # Check for a win (three in a row, column, or diagonal)
  def winner
    # Check rows
    @grid.each do |row|
      return row[0] if row[0] && row.uniq.length == 1
    end

    # Check columns
    3.times do |col|
      if @grid[0][col] && @grid[0][col] == @grid[1][col] && @grid[1][col] == @grid[2][col]
        return @grid[0][col]
      end
    end

    # Check diagonals
    if @grid[0][0] && @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
      return @grid[0][0]
    end

    if @grid[0][2] && @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
      return @grid[0][2]
    end

    nil
  end

  # Check if the board is full (a draw)
  def full?
    @grid.flatten.none?(&:nil?)
  end

  # Check if the game is over (win or draw)
  def game_over?
    !winner.nil? || full?
  end

  # Display the board
  def display
    puts "\n"
    puts " TIC-TAC-TOE ".center(13, "=")
    puts "\n"
    puts "    0   1   2  "
    puts "  ┌───┬───┬───┐"
    
    @grid.each_with_index do |row, row_index|
      print "#{row_index} │"
      row.each do |cell|
        if cell.nil?
          print "   │"
        else
          print " #{cell} │"
        end
      end
      puts ""
      
      if row_index < 2
        puts "  ├───┼───┼───┤"
      else
        puts "  └───┴───┴───┘"
      end
    end
    puts "\n"
  end
end

