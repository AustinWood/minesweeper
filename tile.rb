require 'byebug'

class Tile
  NEARBY = [[1,-1],[1,0],[1,1],[0,-1],[0,1],[-1,-1],[-1,0],[-1,1]]
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

  def nearby_mines(board)
    count = 0
    tile_pos = pos(board)
    NEARBY.each do |el|
      new_pos = [tile_pos[0] + el[0], tile_pos[1] + el[1]]
      next unless board.in_bounds?(new_pos)
      count += 1 if board[new_pos].mine
    end
    count
  end

  def pos(board)
    board.grid.each_with_index do |row, i|
      j = row.index(self)
      return [i, j] if j
    end
  end

end
