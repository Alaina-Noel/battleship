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

  xit 'can start the game' do #requires user input
    game = Game.new

    expect(game.run).to eq("Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit.")
  end

  xit 'can end the game when both ships sunk' do #requires user input
    game = Game.new

    expect(game.end_game_coda).to eq()
  end

  xit 'can give feedback to the user' do #requires user input
    game = Game.new

    expect(game.give_feedback_to_user).to eq()
  end
end
