
class Ship
  def initialize(length)
    @length = length
  end

  def place

    @point = Point.new
    #north = 0, east = 1, etc
    @dir = rand(3)



  end
end

class Point
  attr_reader :x, :y
  def initialize
    @x = rand(9)
    @y = rand(9)
  end
end



