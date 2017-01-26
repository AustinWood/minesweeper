require_relative 'tile.rb'

class Board
  def initialize(size = 9)
    @size = size
    @grid = populate
  end

  def populate
    tiles = Tile.random_tiles(@size)
  end

end
