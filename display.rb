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
    puts "\n"
    @board.board.each_with_index  do |row, idx1|
      row.each_with_index do |el,idx2|
        if [idx1,idx2] == @cursor.cursor_pos
          if (idx1 + idx2) % 2 == 0
            if el.color.nil?
              print el.piece.colorize(color: :red, background: :red)
            else
              print el.piece.colorize(background: :cyan)
            end
          else
            if el.color.nil?
              print el.piece.colorize(color: :red, background: :red)
            else
              print el.piece.colorize(background: :yellow)
            end
          end
        else
          if (idx1 + idx2) % 2 == 0
            if el.color.nil?
              print el.piece.colorize(background: :cyan)
            else
              print el.piece.colorize(color: el.color, background: :cyan)
            end
          else
            if el.color.nil?
              print el.piece.colorize(background: :yellow)
            else
              print el.piece.colorize(color: el.color, background: :yellow)
            end
          end
        end
      end
      puts "\n"
    end
  end

   def render_loop
     while true
       system('clear')
       render
       @cursor.get_input
     end
   end
end

my_board = Board.new
d = Display.new(my_board)
 d.render_loop
