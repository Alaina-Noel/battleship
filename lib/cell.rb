class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    if empty?
      @ship = ship
      @empty = false
    end
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end 
  end

  def render(show_ship = false)
    if show_ship == true && @ship != nil && @fired_upon == false
      "S"
    elsif @fired_upon == false
      "."
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship.sunk?
      "X"
    elsif @fired_upon == true && @ship != nil
      "H"
    end
  end

end
