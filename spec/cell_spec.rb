require './lib/ship.rb'
require './lib/cell.rb'
require 'pry'

RSpec.describe do

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  it 'exists' do

    expect(@cell).to be_instance_of(Cell)
  end


  it 'has attributes' do

    expect(@cell.coordinate).to eq("B4")
    expect(@cell.ship).to eq(nil)
    expect(@cell.empty?).to eq(true)
  end

  it 'can place a ship if the cell is empty' do

    expect(@cell.empty?).to eq(true)
    @cell.place_ship(@cruiser)
    expect(@cell.empty?).to eq(false)
    expect(@cell.ship).to eq(@cruiser)
  end

  it 'can reveal its fired_upon? status before & after bring fired_upon' do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq(false)
    @cell.fire_upon
    expect(@cell.fired_upon?).to eq(true)
  end

  it 'can tell a ships health before & after bring fired_upon' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship.health).to eq(3)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
  end

end
