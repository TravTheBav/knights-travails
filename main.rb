require_relative 'board'
require_relative 'node'

b = Board.new

p b.knight_moves([0,0],[1,2])
p b.knight_moves([0,0],[3,3])
p b.knight_moves([3,3],[0,0])
