module SteppingPieces
  def move_dirs
    if self.class == Pawn # check pos
      if self.pos == pos[1] || pos[6] #possibly change to check if its pawns first move
        moves = [[0, 1],[0, 2]]
      ### attacking!!
      ###turns into whatever on the final rank ## get.input
      else
        moves = [0, 1]
      end
    elsif self.class == Knight
      moves = [[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2]]
    elsif self.class == King
      [[1,1],[-1,-1],[-1,1],[1,-1],[0,1],[0,-1],[1,0],[-1,0]] # jsut don't loop
    end
  end

  def step_move
    possible_moves = []
    self.moves_dirs.each do |spot|
      curr_pos = [self.pos[0] + spot[0], self.pos[1] + spot[1]]
      if valid_pos?(curr_pos) && valid?(curr_pos[0],curr_pos[1])
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
  #   possible_moves = []
  #   self.moves_dirs.each do |spot|
  #     curr_pos = [self.pos[0] + spot[0], self.pos[1] + spot[1]]
  #     if valid_pos?(curr_pos)
  #       x_cord = spot[0] + self.pos[0]
  #       y_cord = spot[1] + self.pos[1]
  #       next if not_valid?(x_cord, y_cord)
  #       possible_moves << [x_cord, y_cord]
  #       curr_pos = [x_cord, y_cord]
  #     end
  #   end
  #   possible_moves
  # end
end
