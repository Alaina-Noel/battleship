class Game
  attr_reader :player_board, :computer_board,
              :player_cruiser, :player_submarine,
              :computer_cruiser, :computer_submarine,
              :computer_choices, :player_input,
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

  def give_feedback_to_user(guess)
    if !@computer_board.cells[guess].empty && @computer_board.cells[guess].ship.sunk
      puts "You've sunk a ship with your shot on cell #{guess}!"
    elsif @computer_board.cells[guess].empty
      puts "#{guess} was a miss!"
    elsif !@computer_board.cells[guess].empty
      puts "You've hit cell #{guess}!"
    end
  end

  def give_feedback_from_computer(guess_cell_object)
    guess = guess_cell_object.coordinate
    if !@player_board.cells[guess].empty && @player_board.cells[guess].ship.sunk
      puts "I've sunk your ship with my guess on #{guess}!"
    elsif @player_board.cells[guess].empty
      puts "My guess at #{guess} was a miss!"
    elsif !@player_board.cells[guess].empty
      puts "HAHA I've hit cell #{guess}!"
    end
  end

  def end_game_coda
    if @computer_cruiser.sunk == true && @computer_submarine.sunk == true
    puts "Congratulations! You won!"
    elsif @player_cruiser.sunk == true && @player_submarine.sunk == true
    puts "Try again another day, I won!"
    end
    run
  end

  def create_computer_board
    @computer_board.place(@computer_cruiser, @computer_choices.randomly_generated_cruiser_array)
    @computer_board.place(@computer_submarine, @computer_choices.randomly_generated_sub_array)
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships.\nThe Cruiser is 3 units long and the Submarine is 2 units long."
  end

  def create_player_board
    puts @player_board.render(true)
    puts "Enter the squares for the #{@player_cruiser.name} in order (#{@player_cruiser.length} spaces). You can only place your ship vertically or horizontally:"

    user_placement_choice = gets.chomp.upcase.split(" ")
    until @player_board.valid_placement?(@player_cruiser, user_placement_choice)
      puts "That isn't a valid placement."
      puts "Enter the squares for the #{@player_cruiser.name} in order (#{@player_cruiser.length} spaces). You can only place your ship vertically or horizontally:"
      user_placement_choice = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@player_cruiser, user_placement_choice)
    puts @player_board.render(true)

    puts "Enter the squares for the #{@player_submarine.name} in order (#{@player_submarine.length} spaces). You can only place your ship vertically or horizontally:"
    user_placement_choice = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@player_submarine, user_placement_choice)
      puts "That isn't a valid placement."
      puts "Enter the squares for the #{@player_submarine.name} in order (#{@player_submarine.length} spaces). You can only place your ship vertically or horizontally:"
      user_placement_choice = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@player_submarine, user_placement_choice)
    puts @player_board.render(true)
    puts "Now that you have placed your ships, it's time to strike."
  end

  def play_game
    create_computer_board
    create_player_board

    until @player_cruiser.sunk == true && @player_submarine.sunk == true || @computer_cruiser.sunk == true && @computer_submarine.sunk == true
      puts "Which coordinate do you think your opponent ship is on?"
      player_guess = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_guess)
        if @computer_board.cells[player_guess].fired_upon == true
          puts "You really shouldn't waste time shooting at the same coordinate, please try again."
        elsif
          @computer_board.cells[player_guess].fire_upon
          puts "=============COMPUTER BOARD============="
          puts @computer_board.render
          give_feedback_to_user(player_guess)
          @computer_guess_array.shuffle!
          next_cell = @player_board.cells[@computer_guess_array.delete_at(0)]
          next_cell.fire_upon
          give_feedback_from_computer(next_cell)
        #############################################################
          puts "==============PLAYER BOARD=============="
          puts @player_board.render(true)
          end
      elsif
        puts "Please enter a VALID coordinate within the playing field."
      end
    end
    end_game_coda
  end

end
