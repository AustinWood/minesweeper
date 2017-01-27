require_relative './board.rb'

class Tile
  attr_accessor :mine, :flagged, :revealed

  def initialize(mine)
    @mine = mine
    @flagged = false
    @revealed = false
  end

  def self.random_tiles(board_size)
    # TODO Allow user input of constants,
    # or create CONSTANTS_VARS, MINE_COUNT = 10, BOARD_SIZE = 9
    puts board_size
    tile_arr = [true] * 10 + [false] * (board_size ** 2 - 10)
    tile_arr.shuffle.map { |mine| self.new(mine) }
  end

  def swap_flag
    @flagged = !@flagged
  end

  def reveal
    @revealed = true
  end

  def mine_count(board)
    mine_count = 0
    mine_count += horiz_mines(board)
    mine_count += vert_mines(board)
  end

  def horiz_mines(board)
    self_pos = self.pos(board)
    left_pos = [self_pos.first, self_pos.last - 1]
    right_pos = [self_pos.first, self_pos.last + 1]
    mine_count = 0
    if left_pos[1] >= 0
      mine_count += 1 if board[left_pos].mine
    end
    if right_pos[1] < board.size
      mine_count += 1 if board[right_pos].mine
    end
    mine_count
  end

  def vert_mines(board)
    
  end

  def pos(board)
    board.grid.each_with_index do |row, i|
      j = row.index(self)
      return [i, j] if j
    end
  end

end
