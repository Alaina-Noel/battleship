class Game

  def initialize
  end

  def start
    puts "     Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit."
    answer = gets.chomp

      if answer.downcase == "p"
          puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
          #computer place ships before this (need to write that)
          #player place ships (writing that now)
          @board = Board.new
          cruiser = Ship.new("Cruiser", 3)
          submarine = Ship.new("Submarine", 2)
          puts @board.render
          puts "Enter the squares for the Cruiser in order (3 spaces) You can only place your ship vertically or horizontally:"
          user_choice_for_cruiser = gets.chomp.split(" ")
          unless @board.valid_placement?(cruiser, user_choice_for_cruiser)
            #not reaching this, yet!
            puts "That isn't a valid placement."
          else
            @board.place(cruiser, user_choice_for_cruiser)
            puts @board.render(true)
            puts "Place your 2nd ship called the Submarine (2 spaces) You cannot overlap ships, so don't try!"
            user_choice_for_submarine = gets.chomp.split(" ")
            unless @board.valid_placement?(submarine, user_choice_for_submarine)
              puts "That isn't a valid placement!"
            else
              @board.place(submarine, user_choice_for_submarine)
              puts @board.render(true)
            end

          end
      elsif answer == "q"
        puts "Please remove yourself from the battlefield..."
      else
        puts "Please try again using either p to play or q to quit."
        answer = gets.chomp
      end
  end



end

#I think this should be added to the unless statement for validating board placement but valid_coordinate
#can only be called on a board object & i am calling it on an array.
#&& user_choice_for_cruiser.all? {|coordinate| valid_coordinate?(coordinate)}
