class Board
  def initialize(size = 9)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

end
