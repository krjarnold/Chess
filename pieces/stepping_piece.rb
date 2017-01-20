require "colorize"
require_relative "piece"

class SteppingPiece < Piece

  KNIGHT_DIRECTIONS = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [ 1, -2],
    [ 1, 2],
    [ 2, -1],
    [ 2, 1]
  ]

  KING_DIRECTIONS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0,-1],
    [-1,-1],
    [1,1],
    [1,-1],
    [-1,1]
  ]

  def moves
    moves = []
    directions = move_dirs
    directions.each do |dir|
      delta_x = dir[0]
      delta_y = dir[1]
        new_pos = [(pos[0] + delta_x), (pos[1] + delta_y)]
        if board.in_bounds?(new_pos)
            moves << new_pos
        end
    end
    moves
  end



end
