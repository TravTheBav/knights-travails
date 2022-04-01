require_relative 'board'

b = Board.new
moves = b.knight_moves([3,3],[4,3])

moves.each do |pos|
  system('clear')
  b.highlighted = pos
  b.pretty_print
  sleep(1.5)
end

puts
puts "You made it in 3 moves!  Here's your path:"
moves.each { |move| p move }
