require_relative 'piece.rb'
require 'byebug'
require 'colorize'
class IllegalMoveError < StandardError
end

class Board

  attr_accessor :board

  def self.chess_board

    @board = Array.new(8) {Array.new(8)}
    white_pawn_rank, black_pawn_rank = [1], [6]
    white_capital_rank, black_capital_rank = [0],[7]
    rook_file = [0,7]
    knight_file = [1,6]
    bishop_file = [2,5]
    queen_file = [3]
    king_file = [4]
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if white_capital_rank.include?(row_index) && rook_file.include?(col_index)
          @board[row_index][col_index] = Rook.new(self, :white, [[row_index],[col_index]])
        elsif white_capital_rank.include?(row_index) && knight_file.include?(col_index)
          @board[row_index][col_index] = Knight.new(self, :white, [[row_index],[col_index]])
        elsif white_capital_rank.include?(row_index) && bishop_file.include?(col_index)
          @board[row_index][col_index] = Bishop.new(self, :white, [[row_index],[col_index]])
        elsif white_capital_rank.include?(row_index) && queen_file.include?(col_index)
          @board[row_index][col_index] = Queen.new(self, :white, [[row_index],[col_index]])
        elsif white_capital_rank.include?(row_index) && king_file.include?(col_index)
          @board[row_index][col_index] = King.new(self, :white, [[row_index],[col_index]])
        elsif white_pawn_rank.include?(row_index)
          @board[row_index][col_index] = Pawn.new(self, :white, [[row_index],[col_index]])
        elsif black_pawn_rank.include?(row_index)
          @board[row_index][col_index] = Pawn.new(self, :black, [[row_index],[col_index]])
        elsif black_capital_rank.include?(row_index) && rook_file.include?(col_index)
          @board[row_index][col_index] = Rook.new(self, :black, [[row_index],[col_index]])
        elsif black_capital_rank.include?(row_index) && knight_file.include?(col_index)
          @board[row_index][col_index] = Knight.new(self, :black, [[row_index],[col_index]])
        elsif black_capital_rank.include?(row_index) && bishop_file.include?(col_index)
          @board[row_index][col_index] = Bishop.new(self, :black, [[row_index],[col_index]])
        elsif black_capital_rank.include?(row_index) && queen_file.include?(col_index)
          @board[row_index][col_index] = Queen.new(self, :black, [[row_index],[col_index]])
        elsif black_capital_rank.include?(row_index) && king_file.include?(col_index)
          @board[row_index][col_index] = King.new(self, :black, [[row_index],[col_index]])
        else
          @board[row_index][col_index] = NullPiece.new
        end
      end
    end
  end

  def initialize(board = self.class.chess_board)
    @board = board
  end

  def display
    @board
  end


  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    if start_pos == NullPiece
      raise IllegalMoveError
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end


  def open_positions
    open_positions = []
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        open_positions.push([row_index, col_index]) unless col
      end
    end
    open_positions
  end
end
#
b = Board.new
# puts b.board
