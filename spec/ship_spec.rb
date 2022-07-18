require './lib/ship'

RSpec.describe do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cruiser).to be_instance_of(Ship)
  end

  it 'has attributes' do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
    expect(@cruiser.length).to eq(@cruiser.health)
  end

  it 'loses health' do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
  end

  it 'can be sunk' do
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(false)

    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end
end
