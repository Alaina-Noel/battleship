class Board
    attr_reader :cells
    
    def initialize
        @cells = Hash.new
        @cell_1 = Cell.new("C")
        @cell_2 = Cell.new("C2")
        @cell_3 = Cell.new("C3")
        @cell_4 = Cell.new("C4")
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
        
    #need every key of the Hash to be cell.coordinate. Need Key to be the Cell object. 


end 