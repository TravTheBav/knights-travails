require_relative 'board'

b = Board.new
b.pretty_print

pos = [0, 0]
b[pos] = 'K'

2.times {puts}

b.pretty_print