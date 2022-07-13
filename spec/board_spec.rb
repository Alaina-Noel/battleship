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
  end







end
