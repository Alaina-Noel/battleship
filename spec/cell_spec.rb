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

  it 'can tell a ships health before & after being fired_upon' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship.health).to eq(3)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.ship.length).to eq(3)
  end

  it 'can show status of render when cell empty' do 
      @cell_1= Cell.new("B4")
  
      expect(@cell_1.render).to eq('.')
      @cell_1.fire_upon
      expect(@cell_1.render).to eq('M')
  end 

  it 'can show status of render when cell full' do 
    @cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    @cell_2.place_ship(cruiser)

    expect(@cell_2.render).to eq('.')
    expect(@cell_2.render(true)).to eq('S')
    @cell_2.fire_upon
    expect(@cell_2.render).to eq('H')
  end 

end
