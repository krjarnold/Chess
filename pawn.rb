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
      new_pos += attack_moves
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
      new_pos += attack_moves

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

  def attack_moves
    if color == :black
      directions = BLACK_PAWN_ATTACK_DIRECTION
    else
      directions = WHITE_PAWN_ATTACK_DIRECTION
    end

    moves = []
    directions.each do |dir|
      delta_x = dir[0]
      delta_y = dir[1]
        new_pos = [(pos[0] + delta_x), (pos[1] + delta_y)]
        unless board[new_pos].is_a?(NullPiece)
          if self.color != board[new_pos].color
              moves << new_pos
          end
        end
    end
    moves
  end

end
