require "colorize"
require_relative "piece"


class SlidingPiece < Piece

  STRAIGHT_DIRECTIONS = [[1,0], [0,1], [-1,0], [0,-1]]
  DIAGONAL_DIRECTIONS = [[-1,-1], [1,1], [1,-1], [-1,1]]

  def moves
    moves = []
    directions = move_dirs
    directions.each do |dir|
      delta_x = dir[0]
      delta_y = dir[1]
      moves.concat(expand_moves(delta_x, delta_y))
    end
    moves
  end

  private

  def expand_moves(delta_x, delta_y)
    x = delta_x
    y = delta_y
    moves = []
    while true
      new_pos = [(pos[0] + x), (pos[1] + y)]
      break unless board.in_bounds?(new_pos)

      if board[new_pos].is_a?(NullPiece)
        moves << new_pos
      elsif self.color == board[new_pos].color
          break
      else
        moves << new_pos
      end
      x += delta_x
      y += delta_y

    end
    moves
  end

end









#
# @deltas = [] # if pos are the deltas from each of the pieces
# valid_moves = []
# @deltas.each do |delta|
#   pos.each_with_index do |el, i|
#     new_pos = []
#     new_pos << el + start_pos[i]
#   end
#   valid_moves << new_pos
# end
# valid_moves
