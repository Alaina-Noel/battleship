class Game
    attr_reader :player_board, :computer_board, :player_cruiser, :player_submarine,
                :computer_cruiser, :computer_submarine, :computer_choices, :player_input,
                :computer_guess_array

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_input = nil
    @computer_choices = nil
    @computer_guess_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def run
    until @player_input == "q"
      puts "Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit."
      @player_input = gets.chomp
      if @player_input == "p"
        run_computer_choices
        play_game
        return
      end
    end
  end

  def run_computer_choices
      @computer_choices = ComputerChoices.new
      until computer_choices.valid_placement_computer?
        @computer_choices = ComputerChoices.new
    end
  end



  def play_game
    @computer_board.place(@computer_cruiser, @computer_choices.randomly_generated_cruiser_array)
    @computer_board.place(@computer_submarine, @computer_choices.randomly_generated_sub_array)
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships.\nThe Cruiser is 3 units long and the Submarine is 2 units long."
    puts @player_board.render(true)
    puts "Enter the squares for the #{@player_cruiser.name} in order (#{@player_cruiser.length} spaces). You can only place your ship vertically or horizontally:"

    user_placement_choice = gets.chomp.split(" ")
    until @player_board.valid_placement?(@player_cruiser, user_placement_choice)
      puts "That isn't a valid placement."
      puts "Enter the squares for the #{@player_cruiser.name} in order (#{@player_cruiser.length} spaces). You can only place your ship vertically or horizontally:"
      user_placement_choice = gets.chomp.split(" ")
    end
    @player_board.place(@player_cruiser, user_placement_choice)
    puts @player_board.render(true)

    puts "Enter the squares for the #{@player_submarine.name} in order (#{@player_submarine.length} spaces). You can only place your ship vertically or horizontally:"
    user_placement_choice = gets.chomp.split(" ")

    until @player_board.valid_placement?(@player_submarine, user_placement_choice)
      puts "That isn't a valid placement."
      puts "Enter the squares for the #{@player_submarine.name} in order (#{@player_submarine.length} spaces). You can only place your ship vertically or horizontally:"
      user_placement_choice = gets.chomp.split(" ")
    end
    @player_board.place(@player_submarine, user_placement_choice)
    puts @player_board.render(true)
    puts "Now that you have placed your ships, it's time to strike."

    until @player_cruiser.sunk == true && @player_submarine.sunk == true || @computer_cruiser.sunk == true && @computer_submarine.sunk == true
      puts "Which coordinate do you think your opponent ship is on?"
      first_player_guess = gets.chomp
      @computer_board.cells[first_player_guess].fire_upon
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render
      puts
      next_cell = @player_board.cells[@computer_guess_array.shuffle.pop]
      next_cell.fire_upon
      puts "I've taken my shot as well"
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      require "pry"
      binding.pry
    end

    puts "Game over!"


  end



  #
  # def place_ship(ship)
  #   puts @player_board.render
  #   puts "Enter the squares for the #{ship.name} in order (#{ship.length} spaces). You can only place your ship vertically or horizontally:"
  #   user_placement_choice = gets.chomp.split(" ")
  #
  #   until @player_board.valid_placement?(ship, user_placement_choice)
  #     puts "That isn't a valid placement."
  #     puts "Enter the squares for the #{ship.name} in order (#{ship.length} spaces). You can only place your ship vertically or horizontally:"
  #     user_placement_choice = gets.chomp.split(" ")
  #   end
  #   @player_board.place(ship, user_placement_choice)
  # end

end
