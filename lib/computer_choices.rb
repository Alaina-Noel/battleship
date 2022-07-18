class ComputerChoices
  attr_reader :randomly_generated_sub_array, :randomly_generated_cruiser_array

  def initialize
    @randomly_generated_sub_array = [
      ["A1", "A2"],["A2", "A3"], ["A3", "A4"],
      ["B1", "B2"],["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"],["C2", "C3"], ["C3", "C4"],
      ["D1", "D2"],["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"],["B1", "C1"], ["C1", "D1"],
      ["A2", "B2"],["B2", "C2"], ["C2", "D2"],
      ["A3", "B3"],["B3", "C3"], ["C3", "D3"],
      ["A4", "B4"],["B4", "C4"], ["C4", "D4"],
    ].sample

    @randomly_generated_cruiser_array = [
      ["A1", "A2", "A3"],["A2", "A3", "A4"],
      ["B1", "B2", "B3"],["B2", "B3", "B4"],
      ["C1", "C2", "C3"],["C2", "C3", "C4"],
      ["D1", "D2", "D3"],["D2", "D3", "D4"],
      ["A1", "B1", "C1"],["A2", "B2", "C2"],
      ["A3", "B3", "C3"],["A4", "B4", "C4"],
      ["B1", "C1", "D1"],["B1", "C1", "D2"],
      ["B3", "C3", "D3"],["B4", "C4", "D4"],
    ].sample
  end

  def valid_placement_computer?
    @randomly_generated_sub_array & @randomly_generated_cruiser_array == []
  end

end
