# a class representing a node

class Node
  attr_accessor :pos, :parent, :children
  
  def initialize(pos, parent = nil)
    @pos = pos
    @parent = parent
    @children = []
  end
  
  def inspect
    pos.to_s
  end
end