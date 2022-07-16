class Game

  def initialize
  end

  def start
    puts "     Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit."
    answer = gets.chomp


    valid_submarine_placements = [
      ["A1", "A2"],["A2", "A3"], ["A3", "A4"],
      ["B1", "B2"],["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"],["C2", "C3"], ["C3", "C4"],
      ["D1", "D2"],["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"],["B1", "C1"], ["C1", "D1"],
      ["A2", "B2"],["B2", "C2"], ["C2", "D2"],
      ["A3", "B3"],["B3", "C3"], ["C3", "D3"],
      ["A4", "B4"],["B4", "C4"], ["C4", "D4"],
    ]

    valid_cruiser_placements = [
      ["A1", "A2", "A3"],["A2", "A3", "A4"],
      ["B1", "B2", "B3"],["B2", "B3", "B4"],
      ["C1", "C2", "C3"],["C2", "C3", "C4"],
      ["D1", "D2", "D3"],["D2", "D3", "D4"],
      ["A1", "B1", "C1"],["A2", "B2", "C2"],
      ["A3", "B3", "C3"],["A4", "B4", "C4"],
      ["B1", "C1", "D1"],["B1", "C1", "D2"],
      ["B3", "C3", "D3"],["B4", "C4", "D4"],
    ]


      if answer.downcase == "p"
          puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
          #computer place ships before this (need to write that)
          #player place ships (writing that now)
          @player_board = Board.new
          @computer_board = Board.new
          player_cruiser = Ship.new("Cruiser", 3)
          player_submarine = Ship.new("Submarine", 2)
          computer_cruiser = Ship.new("Cruiser", 3)
          computer_submarine = Ship.new("Submarine", 2)

          randomly_generated_sub_array = valid_submarine_placements.sample
          randomly_generated_cruiser_array = valid_cruiser_placements.sample

          @computer_board.place(computer_cruiser, randomly_generated_sub_array)
          @computer_board.place(computer_submarine, randomly_generated_cruiser_array)

          puts @player_board.render
          puts "Enter the squares for the Cruiser in order (3 spaces) You can only place your ship vertically or horizontally:"
          user_choice_for_cruiser = gets.chomp.split(" ")
          unless @player_board.valid_placement?(player_cruiser, user_choice_for_cruiser)
            #not reaching this, yet!
            puts "That isn't a valid placement."
          else
            @player_board.place(player_cruiser, user_choice_for_cruiser)
            puts @player_board.render(true)
            puts "Place your 2nd ship called the Submarine (2 spaces) You cannot overlap ships, so don't try!"
            user_choice_for_submarine = gets.chomp.split(" ")
            unless @player_board.valid_placement?(player_submarine, user_choice_for_submarine)
              puts "That isn't a valid placement!"
            else
              @player_board.place(player_submarine, user_choice_for_submarine)
              puts @player_board.render(true)
            end

          end
      elsif answer == "q"
        puts "Please remove yourself from the battlefield..."
      else
        puts "Please try again using either p to play or q to quit."
        answer = gets.chomp
      end


      puts "Now that you have placed your ships, it's time to strike."
      puts
      until player_cruiser.sunk == true && player_submarine.sunk == true || computer_cruiser.sunk == true && computer_submarine.sunk == true
        puts "Which coordinate do you think your opponent ship is on?"
        first_player_guess = gets.chomp
        @computer_board.cells[first_player_guess].fire_upon
        puts @computer_board.render
      end
  end



end

#I think this should be added to the unless statement for validating board placement but valid_coordinate
#can only be called on a board object & i am calling it on an array.
#&& user_choice_for_cruiser.all? {|coordinate| valid_coordinate?(coordinate)}
