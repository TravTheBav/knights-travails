# a class representing an 8x8 chess board
require 'colorize'
require_relative 'knight'
require_relative 'node'
require 'pry-byebug'

class Board
  attr_reader :rows, :visited_positions

  def initialize
    @rows = Array.new(8) { Array.new(8, '  ') }
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

  # uses BFS to build a tree of nodes from start to end and returns the ending node
  def build_tree(start_pos, end_pos)
    traveled_positions = []
    queue = [Node.new(start_pos)]
    current_node = queue.shift

    until current_node.pos == end_pos
      traveled_positions << current_node.pos
      moves = valid_moves(current_node.pos).reject { |pos| traveled_positions.include?(pos) }
      moves.each do |pos|
        child_node = Node.new(pos, current_node)
        current_node.children << child_node
        queue << child_node
      end
      current_node = queue.shift
    end
    current_node
  end

  def knight_moves(start_pos, end_pos)
    node = build_tree(start_pos, end_pos)
    knight_path = []

    until node.pos == start_pos
      knight_path << node.pos
      node = node.parent
    end
    knight_path << start_pos
    knight_path.reverse
  end
end
