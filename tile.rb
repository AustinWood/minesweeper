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

  end

  def pos(grid)
    grid.each_with_index do |row, i|
      j = row.index(self)
      return [i, j] if j
    end
  end

end
