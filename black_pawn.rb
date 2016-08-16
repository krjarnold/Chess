require 'colorize'
require_relative 'Pawn'


class BlackPawn < Pawn
  def move_dirs
    BLACK_FIRST_MOVE_DIRECTION
    BLACK_PAWN_DIRECTION
    BLACK_PAWN_ATTACK_DIRECTION

    start_row = BLACK_PAWN_DIRECTION
    # logic: 
  end
end
