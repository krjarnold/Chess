require "colorize"
require_relative "sliding_piece"

class Bishop < SlidingPiece

  def initialize(color, board, position, symbol)
    super(color, board, position)
    @symbol = symbol
  end

  def move_dirs
    DIAGONAL_DIRECTIONS
  end

end
