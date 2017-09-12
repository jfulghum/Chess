require_relative 'board.rb'

class Piece
  attr_accessor :piece, :pos, :color
  def initialize(piece = "piece ")
    @piece = piece
    @pos = pos
    @color = color
  end

  def moves

  end

  def inspect

  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def not_valid?(x,y)
    x < 0 || x > 8 || y < 0 || y > 8
  end
end

#
# class Bishop < Piece
#   include SlidingPieces
# end
#
# class Queen < Piece
#   include SlidingPieces
# end
#
# class Rook < Piece
#   include SlidingPieces
# end
#
class Pawn < Piece
  def initialize(piece = "pawn")
    @piece = piece
  end
  # include SteppingPieces
end
#
# class Knight < Piece
#   include SteppingPieces
# end
#
# class King < Piece
#   include SteppingPieces
# end


class NullPiece < Piece

    def initialize(piece = 'nil  ')
      @piece = piece
    end

end
