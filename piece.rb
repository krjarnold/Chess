require "colorize"



class Piece

  attr_accessor :pos
  attr_reader :board, :color, :valid_moves

  def initialize(color, board, pos = [])
    @color = color
    @board = board
    @pos = pos
    @valid_moves = []
  end

  # def moves
  # end

  def to_s
    @symbol
  end

  def valid_moves
    @valid_moves = moves
  end


  # def empty?
  #   valid_moves(pos).empty?
  # end

  # def move_into_check?(to_pos)
  #   #this checks if the move is check
  #   #check Kings's position
  #   pos == to_pos
  # end

end
