require "colorize"
require_relative "sliding_piece"

class Rook < SlidingPiece

  attr_reader :symbol

  def initialize(color, board, position, symbol)
    super(color, board, position)
    @symbol = symbol
  end

  def move_dirs
    STRAIGHT_DIRECTIONS
  end
end
