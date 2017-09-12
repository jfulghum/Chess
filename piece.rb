require 'byebug'
require_relative 'sliding_piece_module.rb'
require_relative 'stepping_pieces.rb'

class Piece
  attr_accessor :piece, :pos, :color
  def initialize(board, color, pos)
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

  def valid_pos?(curr_pos)
      # if its an enemy its good but break out
      # if friend stop befor it
      #
  end
end


class Bishop < Piece
  include SlidingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265D " : @piece = " \u2657 "
  end
end

class Queen < Piece
  include SlidingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265B " : @piece = " \u2655 "
  end
end

class Rook < Piece
  include SlidingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265C " : @piece = " \u2656 "
  end
end

class Pawn < Piece
  include SteppingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265F " : @piece = " \u2659 "
  end
end
#
class Knight < Piece
  include SteppingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265E " : @piece = " \u2658 "
  end
end

class King < Piece
  include SteppingPieces
  def initialize(board, color = nil, pos)
    super(board, color, pos)
    @piece = piece
    color == :black ? @piece = " \u265A " : @piece = " \u2654 "
  end
end


class NullPiece < Piece
  # include Singleton
  def initialize(piece = '   ')
    @piece = piece
  end
end
