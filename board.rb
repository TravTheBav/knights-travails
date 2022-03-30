# a class representing an 8x8 chess board
require 'colorize'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, '  ') }
  end

  def pretty_print
    rows.each_with_index do |row, row_idx|
      row.each_with_index do |space, col_idx|
        case row_idx.even?
        when true
          col_idx.even? ? color = :white : color = :black
        else
          col_idx.even? ? color = :black : color = :white
        end
        print space.colorize(:background => color)
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
    rows[row][col] = piece + ' '
  end
end