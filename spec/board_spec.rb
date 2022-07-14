require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require 'pry'

RSpec.describe do

  before(:each) do
    @board = Board.new
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
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
  end

  it 'contains a Hash object as a board of cells' do
    expect(@board.cells.class).to eq(Hash)
  end

  it 'is instantiated with 16 cell objects' do
    expect(@board.cells.count).to eq(16)
  end

  it 'contains a hash where the values are all card objects' do
    expect(@board.cells.values).to all(be_an(Cell))
  end

  it 'can validate a coordinate' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
    expect(@board.valid_coordinate?("a5")).to eq(false)
  end

  it 'can validate placement length' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  end

  it 'can validate placement order being conscutive' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(true)
  end

  it 'can not have a ship be placed diagonally' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["D2", "D3"])).to eq(true)
    expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'can place a ship in consecutive cells and verify its the same ship in consecutive cells' do
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])

    expect(@cell_1.ship).to eq(@cell_2.ship)
    expect(@cell_2.ship).to eq(@cell_2.ship)
    expect(@cell_1.ship).to eq(@cell_3.ship)
    expect(@cell_1.ship == @cell_2.ship).to eq(true)
    expect(@cell_6.ship).to eq(nil)
  end

  it 'cannot place overlapping ships' do
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)


    expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["D1", "D2"])).to eq(true)
  end

  it 'can render the board and hide status of hidden ships when passing true argument' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @board.place(cruiser, ["A1", "A2", "A3"])
    @board.render

    expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it 'can render the board and reveals status of hidden ships when passing true argument' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @board.place(cruiser, ["A1", "A2", "A3"])
    @board.render

    expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end















end
