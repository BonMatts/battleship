
class Ship
  def initialize(length)
    @length = length
  end

  def place

    @point = Point.new
    #north = 0, east = 1, etc
    @dir = rand(3)



  end

  def is_valid? (point, dir, length)

    case dir
      # north
      # if the starting point on the y axis  plus the length of the ship is greater than 9, it is invalid
      when 0
         point.y + length > 9 ? false:true

      # east
      # if the starting point on the x axis  plus the length of the ship is greater than 9, it is invalid
      when 1
        point.x + length > 9 - length ? false:true

      # south
      # if the starting point on the y axis minus the ship length is less than 0 (the board size), it is invalid
      when 2
        point.y - length < 0 ? false:true

      # west
      # if the starting point on the y axis minus the ship length is less than 0 (the board size), it is invalid
      when 3
        point.y - length < 0 ? false:true
    end
  end
end

class Point
  attr_reader :x, :y
  def initialize
    @x = rand(9)
    @y = rand(9)
  end
end



