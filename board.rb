require_relative './tile.rb'

class Board
  attr_reader :grid, :size

  def initialize(size = 9)
    @size = size
    @grid = populate.to_a
  end

  def populate
    Tile.random_tiles(@size).each_slice(@size)
  end


  def render
    #render currently shows all bombs during build
    #TODO revise render to hide bombs until game over
    #TODO add number functionality
    puts "\n  ＡＢＣＤＥＦＧＨＩ"
    grid.each_with_index do |row, i|
      #row_str = (i <= 8 ? " #{i + 1} " : "#{i + 1} ")
      row_str = "#{i + 1} "
      row.each do |tile|
        if tile.mine
          row_str << "💣 "
        elsif tile.flagged
          row_str << "⚑ "
        elsif tile.revealed
          row_str << "  "
        else
          row_str << "▢ "
        end
      end
      puts row_str
    end
    puts ""
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

end
