
class Ship
  def initialize(length)
    @length = length
  end

  def place

    #north = 0, east = 1, etc
    @orientation = rand(3)
    @point

    unless defined? @point && @point.is_valid?(@orientation, @length)
      @point = Point.new
    end


  end


end

class Point
  attr_reader :x, :y
  def initialize
    @x = rand(9)
    @y = rand(9)
  end

  def is_valid? (dir, length)

    case dir
      # north
      # if the starting point on the y axis  plus the length of the ship is greater than 9, it is invalid
      when 0
        @y + length > 9 ? false:true

      # east
      # if the starting point on the x axis  plus the length of the ship is greater than 9, it is invalid
      when 1
        @x + length > 9 - length ? false:true

      # south
      # if the starting point on the y axis minus the ship length is less than 0 (the board size), it is invalid
      when 2
        @y - length < 0 ? false:true

      # west
      # if the starting point on the y axis minus the ship length is less than 0 (the board size), it is invalid
      when 3
        @x - length < 0 ? false:true
    end
  end

end



