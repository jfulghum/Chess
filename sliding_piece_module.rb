

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

  def slide_move
    # moves = [[1,1],[-1,-1],[-1,1],[1,-1]]
    possible_moves = []
    self.moves_dirs.each do |spot|
      curr_pos = [self.pos[0] + spot[0], self.pos[1] + spot[1]]
      while valid_pos?(curr_pos) && valid?(curr_pos[0],curr_pos[1])
        possible_moves << [curr_pos]
        break if !@board.pos[curr_pos].nil?
        # if the piece at curr_pos is a different color, BREAK
        x_cord = spot[0] + self.pos[0]
        y_cord = spot[1] + self.pos[1]
        curr_pos = [x_cord, y_cord]
      end
      # x_cord = spot[0] + self.pos[0]
      # y_cord = spot[1] + self.pos[1]
      # next if not_valid?(x_cord, y_cord)
    end
    possible_moves
  end
end
