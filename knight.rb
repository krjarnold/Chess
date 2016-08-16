require "colorize"
require_relative "stepping_piece"

class Knight < SteppingPiece

  def initialize(color, board, position, symbol)
    super(color, board, position)
    @symbol = symbol
  end

  def move_dirs
    KNIGHT_DIRECTIONS
  end

end
