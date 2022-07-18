require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/game.rb'

RSpec.describe do

  it 'exists' do
    game = Game.new
    expect(game).to be_instance_of(Game)
  end

  xit 'can start the game' do
    game = Game.new
    game.start
    expect(game.start).to eq("heyo")
  end

  xit 'can end the game when ships sunk' do
    game = Game.new
    game.start

  end
end
