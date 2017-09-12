require_relative "piece.rb"

module SlidingPieces
  def move_dirs
    if self.class == Bishop
      return moves = [[1,1],[-1,-1],[-1,1],[1,-1]]
    elsif self.class == Rook
      return moves = [[0,1],[0,-1],[1,0],[-1,0]]
    elsif self.class == Queen
      return moves = [[1,1],[-1,-1],[-1,1],[1,-1],[0,1],[0,-1],[1,0],[-1,0]]
    end

    #look at selfs class, if something do move set
  end

  def diag_move
    # moves = [[1,1],[-1,-1],[-1,1],[1,-1]]
    possible_moves = []
    self.moves_dirs.each do |spot|
      curr_pos = [self.pos[0] + spot[0], self.pos[1] + spot[1]]
      while valid_pos?(curr_pos)
        x_cord = spot[0] + self.pos[0]
        y_cord = spot[1] + self.pos[1]
        possible_moves << [x_cord, y_cord]
        curr_pos = [x_cord, y_cord]
      end
      x_cord = spot[0] + self.pos[0]
      y_cord = spot[1] + self.pos[1]
      next if not_valid?(x_cord, y_cord)
    end
    possible_moves
  end

  def valid_pos?(curr_pos)
    # if its an enemy its good but break out
    # if friend stop befor it
    #
  end
end
