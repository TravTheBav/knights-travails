# a class representing an 8x8 chess board
require 'colorize'
require_relative 'knight'

class Board
  attr_reader :rows, :visited_positions

  def initialize
    @rows = Array.new(8) { Array.new(8, '  ') }
    @visited_positions = []
  end

  def pretty_print
    rows.each_with_index do |row, row_idx|
      row.each_with_index do |space, col_idx|
        case row_idx.even?
        when true
          color = col_idx.even? ? :white : :black
        else
          color = col_idx.even? ? :black : :white
        end
        print space.colorize(:color => :red, background: color)
      end
      puts
    end
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    rows[row][col] = "#{piece} "
  end

  def in_bounds?(pos)
    row, col = pos
    if row > 7 || col > 7
      false
    elsif row.negative? || col.negative?
      false
    else
      true
    end
  end

  # takes in a position and returns all possible moves that are in bounds
  def valid_moves(pos)
    moves = []
    Knight.moves.each do |move|
      row = pos[0] + move[0]
      col = pos[1] + move[1]
      new_pos = [row, col]
      moves << new_pos if in_bounds?(new_pos)
    end
    moves
  end
end
