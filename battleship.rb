class Ship
  def initialize(length, letter)
    @length, @letter = length,letter

  end



  def place
    @start_point = nil
    while @start_point.nil?

      @start_point = StartingPoint.new
      if @start_point.is_valid?(@length)
        break
      else
        @start_point = nil
      end
    end

    @coordinates = {}
    @length.times do |i|
      @point = coordinate(@start_point, i)
      @coordinates[@point] = @letter

    end
    @coordinates
  end


  def coordinate(start_point, iterator)
    case start_point.orientation
      #north, same x axis, increase y axis by iterator
      when 0
        [start_point.x, start_point.y + iterator]
      #east, increase x axis by iterator, same y axis
      when 1
        [start_point.x + iterator, start_point.y]
      #south, same x axis, decrease y axis by iterator
      when 2
        [start_point.x, start_point.y - iterator]
      #west, decrease x axis by iterator, same y axis
      when 3
        [start_point.x - iterator, start_point.y]
    end
  end

end



class StartingPoint
  attr_reader :x, :y, :orientation
  def initialize
    @x = rand(9)
    @y = rand(9)
    @orientation = rand(3)
  end

  #does this position give us enough space to not fall off the board?
  def is_valid? (length)

    case @orientation
      # north
      # if the starting point on the y axis  plus the length of the ship is less than 9, valid
      when 0
        @y + length <= 9

      # east
      # if the starting point on the x axis  plus the length of the ship is less than 9, it is valid
      when 1
        @x + length <= 9

      # south
      # if the starting point on the y axis minus the ship length is greater than 0, it is valid
      when 2
        @y - length >= 0

      # west
      # if the starting point on the y axis minus the ship length is greater than 0, it is valid
      when 3
        @x - length >= 0
    end
  end
end

class Board


  def initialize
    self.placement = Hash.new

  end

  attr_accessor :placement

  def add_ships(ships)
    ships.each do |ship|
      @coordinates = {}
      @ship_added = false
      while @coordinates == {}
        @coordinates = ship.place
        if add_ship?(@coordinates)
          @ship_added = true
        else
          @coordinates = {}
        end
      end
    end
  end
  def add_ship?(coordinates)
    @merged = @placement.merge(coordinates){|key, old, new| break}

    if @merged.nil?
      false
    else
      self.placement = @merged
      true
    end
  end


  def display
    stringify.each do |line|
      puts line
    end

  end

  private

  def stringify
    @lines = []
    (0..9).each do |x|
      @line = ''
     (0..9).each do |y|
       @k = [x, y]
       @placement.key?(@k)? @line += @placement[@k]:@line += '.'
     end
      @lines << @line
    end
    @lines
  end

end

@ships = [Ship.new(5, 'c'), Ship.new(4, 'b'), Ship.new(3, 's'), Ship.new(3, 'd'), Ship.new(2, 't')]
@board = Board.new

@board.add_ships(@ships)
@board.display






