require_relative 'piece.rb'
require 'byebug'
class IllegalMoveError < StandardError
end

class Board

  attr_accessor :board

  def self.chess_board

    @board = Array.new(8) {Array.new(8)}
    row_indices = [0,7]
    pawn_row = [1,6]
    @board.each_with_index do |row,row_index|
      row.each_with_index do |col, col_index|
        if row_indices.include?(row_index)
          @board[row_index][col_index] = Piece.new.piece
        elsif pawn_row.include?(row_index)
          @board[row_index][col_index] = Pawn.new.piece
        else
          @board[row_index][col_index] = NullPiece.new.piece
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
