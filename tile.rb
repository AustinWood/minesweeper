class Tile


  def initialize(mine)
    @mine = mine
    @flagged = false
    @revealed = false
  end

  def self.random_tiles
    # TODO Allow user input of constants,
    # or create CONSTANTS_VARS, MINE_COUNT = 10, BOARD_SIZE = 9
    tile_arr = [true] * 10 + [false] * (9 ** 2 - 10)
    tile_arr.shuffle.map { |mine| self.new(mine) }
  end
end
