require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/game.rb'

RSpec.describe do

  it 'exists' do
    game = Game.new
    expect(game).to be_instance_of(Game)
  end

  it 'will create the board for both player and computer' do
    game = Game.new

    expect(game.player_board).to be_instance_of(Board)
    expect(game.computer_board).to be_instance_of(Board)
  end

  it 'will create an instance of ships for both player and computer' do
    game = Game.new

    expect(game.player_cruiser).to be_instance_of(Ship)
    expect(game.computer_submarine).to be_instance_of(Ship)
  end

  it 'can show no preloaded user or computer choices at beginning of game' do
    game = Game.new

    expect(game.player_input).to eq(nil)
    expect(game.computer_choices).to eq(nil)
  end

end
