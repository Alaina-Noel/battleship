class Board
  attr_reader :cells, :cell_1, :cell_2, :cell_3, :cell_4, :cell_5,
              :cell_6, :cell_7, :cell_8, :cell_9, :cell_10, :cell_11,
              :cell_12, :cell_13, :cell_14, :cell_15, :cell_16

  def initialize
    @cells = Hash.new
    @cell_1 = Cell.new("A1")
    @cell_2 = Cell.new("A2")
    @cell_3 = Cell.new("A3")
    @cell_4 = Cell.new("A4")
    @cell_5 = Cell.new("B1")
    @cell_6 = Cell.new("B2")
    @cell_7 = Cell.new("B3")
    @cell_8 = Cell.new("B4")
    @cell_9 = Cell.new("C1")
    @cell_10 = Cell.new("C2")
    @cell_11 = Cell.new("C3")
    @cell_12 = Cell.new("C4")
    @cell_13 = Cell.new("D1")
    @cell_14 = Cell.new("D2")
    @cell_15 = Cell.new("D3")
    @cell_16 = Cell.new("D4")
    @cells["A1"] = @cell_1
    @cells["A2"] = @cell_2
    @cells["A3"] = @cell_3
    @cells["A4"] = @cell_4
    @cells["B1"] = @cell_5
    @cells["B2"] = @cell_6
    @cells["B3"] = @cell_7
    @cells["B4"] = @cell_8
    @cells["C1"] = @cell_9
    @cells["C2"] = @cell_10
    @cells["C3"] = @cell_11
    @cells["C4"] = @cell_12
    @cells["D1"] = @cell_13
    @cells["D2"] = @cell_14
    @cells["D3"] = @cell_15
    @cells["D4"] = @cell_16
  end

  def valid_coordinate?(coordinate)
    cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, array_of_coordinates)
    return false if array_of_coordinates.any? {|coordinate| !valid_coordinate?(coordinate)}
    return false if array_of_coordinates.any? {|coordinate| !cells[coordinate].empty?}

    valid_submarine_placements = [
      ["A1", "A2"],["A2", "A3"], ["A3", "A4"],["B1", "B2"],["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"],["C2", "C3"], ["C3", "C4"],["D1", "D2"],["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"],["B1", "C1"], ["C1", "D1"],["A2", "B2"],["B2", "C2"], ["C2", "D2"],
      ["A3", "B3"],["B3", "C3"], ["C3", "D3"],["A4", "B4"],["B4", "C4"], ["C4", "D4"],
    ]

    valid_cruiser_placements = [
      ["A1", "A2", "A3"],["A2", "A3", "A4"],["B1", "B2", "B3"],["B2", "B3", "B4"],
      ["C1", "C2", "C3"],["C2", "C3", "C4"],["D1", "D2", "D3"],["D2", "D3", "D4"],
      ["A1", "B1", "C1"],["A2", "B2", "C2"],["A3", "B3", "C3"],["A4", "B4", "C4"],
      ["B1", "C1", "D1"],["B1", "C1", "D2"],["B3", "C3", "D3"],["B4", "C4", "D4"],
    ]
      if ship.length == 2
        valid_submarine_placements.include?(array_of_coordinates)
      elsif ship.length == 3
        valid_cruiser_placements.include?(array_of_coordinates)
      end
  end


  def place(ship, array_ship_is_on)
    array_ship_is_on.each do |array_element|
      cells.keys.each do |cell_key|
        cells[cell_key].place_ship(ship) if array_element == cell_key
      end
    end
  end


  def render(show_board = false)
    render_container = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    final_render = ""

    if show_board
      render_container.each_char.with_index do |character, index|
        if character != "."
          final_render << character
        elsif index == 13
          final_render << cells["A1"].render(true)
        elsif index == 15
          final_render << cells["A2"].render(true)
        elsif index == 17
          final_render << cells["A3"].render(true)
        elsif index == 19
          final_render << cells["A4"].render(true)
        elsif index == 24
          final_render << cells["B1"].render(true)
        elsif index == 26
          final_render << cells["B2"].render(true)
        elsif index == 28
          final_render << cells["B3"].render(true)
        elsif index ==30
          final_render << cells["B4"].render(true)
        elsif index ==35
          final_render << cells["C1"].render(true)
        elsif index ==37
          final_render << cells["C2"].render(true)
        elsif index ==39
          final_render << cells["C3"].render(true)
        elsif index ==41
          final_render << cells["C4"].render(true)
        elsif index ==46
          final_render << cells["D1"].render(true)
        elsif index ==48
          final_render << cells["D2"].render(true)
        elsif index == 50
          final_render << cells["D3"].render(true)
        elsif index ==52
          final_render << cells["D4"].render(true)
        end
      end
      final_render

    elsif show_board == false
      #don't show the board here
      render_container.each_char.with_index do |character, index|
        if character != "."
          final_render << character
        elsif index == 13
          final_render << cells["A1"].render
        elsif index == 15
          final_render << cells["A2"].render
        elsif index == 17
          final_render << cells["A3"].render
        elsif index == 19
          final_render << cells["A4"].render
        elsif index == 24
          final_render << cells["B1"].render
        elsif index == 26
          final_render << cells["B2"].render
        elsif index == 28
          final_render << cells["B3"].render
        elsif index ==30
          final_render << cells["B4"].render
        elsif index ==35
          final_render << cells["C1"].render
        elsif index ==37
          final_render << cells["C2"].render
        elsif index ==39
          final_render << cells["C3"].render
        elsif index ==41
          final_render << cells["C4"].render
        elsif index ==46
          final_render << cells["D1"].render
        elsif index ==48
          final_render << cells["D2"].render
        elsif index == 50
          final_render << cells["D3"].render
        elsif index ==52
          final_render << cells["D4"].render
        end
      end
      final_render
    end
  end

end
