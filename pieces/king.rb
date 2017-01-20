require "colorize"
require_relative "stepping_piece"

class King < SteppingPiece

  def initialize(color, board, position, symbol)
    super(color, board, position)
    @symbol = symbol
  end

  def move_dirs
    KING_DIRECTIONS
  end

end
