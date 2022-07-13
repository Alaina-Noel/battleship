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

  xit 'exists' do
    expect(@board).to be_instance_of(Board)
  end

  xit 'contains a Hash object as a board of cells' do
    expect(@board.cells.class).to eq(Hash)
  end

  xit 'is instantiated with 16 cell objects' do
    expect(@board.cells.values).to all( be_an(Cell) )
  end






end
