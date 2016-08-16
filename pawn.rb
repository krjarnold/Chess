require 'colorize'
require_relative 'Piece'

class Pawn < Piece

  def initialize(color, board, position, symbol)
    super(color, board, position)
    @symbol = symbol
  end


  BLACK_PAWN_DIRECTION = [1,0]
  BLACK_PAWN_ATTACK_DIRECTION = [[1,-1], [1,1]]

  WHITE_PAWN_DIRECTION = [-1,0]
  WHITE_PAWN_ATTACK_DIRECTION = [[-1,-1], [-1,1]]

  def moves
    moves = []
    if color == :black
      delta_x = BLACK_PAWN_DIRECTION[0]
      delta_y = BLACK_PAWN_DIRECTION[1]
      new_pos = []
      new_pos << [(pos[0] + delta_x), (pos[1] + delta_y)]
      if pos[0] == 1
        new_pos << [(pos[0] + delta_x * 2), (pos[1] + delta_y)]
      end
        new_pos.each do |pos|
          if board.in_bounds?(pos)
            moves << pos
          end
        end
    end

    if color == :white
      delta_x = WHITE_PAWN_DIRECTION[0]
      delta_y = WHITE_PAWN_DIRECTION[1]
      new_pos = []
      new_pos << [(pos[0] + delta_x), (pos[1] + delta_y)]
      if pos[0] == 6
        new_pos << [(pos[0] + delta_x * 2), (pos[1] + delta_y)]
      end
        new_pos.each do |pos|
          if board.in_bounds?(pos)
            moves << pos
          end
        end
    end
    moves
  end

end
