# a class representing a Knight
# contains offsets for all eight directions a knight can move

class Knight
  def self.moves
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end
end
