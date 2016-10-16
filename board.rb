require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "king"
require_relative "knight"
require_relative "pawn"
require_relative "null_piece"
require_relative "piece"

class Board

  def initialize()
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    @black_pieces = []
    @white_pieces = []
  end

  def move(piece_color, start_pos, end_pos)
    piece = self[start_pos]
    end_piece = self[end_pos]
    raise "There's no piece there!" if piece.instance_of?(NullPiece)
    raise "You must move your own piece!" unless piece_color == piece.color
    unless end_piece.is_a?(NullPiece)
       raise "There's already a piece there!" if end_piece.color == piece.color
    end
    raise "The piece can't move like that!" unless piece.valid_moves.include?(end_pos)

    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)

    piece = self[start_pos]

    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def [](pos)
    x, y = pos
    #for deconstructing an array
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def rows
    @grid
  end

  def in_bounds?(pos)
    pos.all? {|coord| coord <= 7 && coord >= 0}
  end

  #color, board, position, symbol

  def populate
  black = [
    Rook.new(:black, self, [0,0], " ♜ "),
    Knight.new(:black, self, [0,1], " ♞ "),
    Bishop.new(:black, self, [0,2], " ♝ "),
    Queen.new(:black, self, [0,3], " ♛ "),
    King.new(:black, self, [0,4], " ♚ "),
    Bishop.new(:black, self, [0,5], " ♝ "),
    Knight.new(:black, self, [0,6]," ♞ "),
    Rook.new(:black, self, [0,7], " ♜ ")
    ]
  white = [
    Rook.new(:white, self, [7,0], " ♖ "),
    Knight.new(:white, self, [7,1], " ♘ "),
    Bishop.new(:white, self, [7,2], " ♗ "),
    Queen.new(:white, self, [7,3], " ♕ "),
    King.new(:white, self, [7,4], " ♔ "),
    Bishop.new(:white, self, [7,5], " ♗ "),
    Knight.new(:white, self, [7,6], " ♘ "),
    Rook.new(:white, self, [7,7], " ♖ ")
  ]

    @grid.each_with_index do |row, i|
        row.each_with_index do |column, j|
          pos = [i, j]
          if i == 0
            self[pos]= black[j]
            @black_pieces << black[j]
          elsif i == 7
            self[pos]= white[j]
            @white_pieces << white[j]
          elsif i == 1
            black_pawn = Pawn.new(:black, self, pos, " ♟ ")
            self[pos]= black_pawn
            @black_pieces << black_pawn
          elsif i == 6
            white_pawn = Pawn.new(:white, self, pos, " ♙ ")
            self[pos] = white_pawn
            @white_pieces << white_pawn
          end
        end
    end

    @grid
  end


end

# a= Board.new
# p a.populate
# b= Display.new(a)
# b.render
