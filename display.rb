require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'
require 'byebug'
class Display < Board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system('clear')
    puts '__________________'
    @board.board.each_with_index  do |row, idx1|
      row.each_with_index do |el,idx2|
        if [idx1,idx2] == @cursor.cursor_pos
          print @board.board[idx1][idx2].colorize(:white)
        else
          print @board.board[idx1][idx2].colorize(:blue)
        end
      end
      puts '________________'
    end

   end

   def render_loop
     while true
       render
       @cursor.get_input
     end
   end
end

my_board = Board.new
d = Display.new(my_board)
d.render_loop
