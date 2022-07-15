class Game

  def initialize
  end

  def start
    puts "     Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit."
    answer = gets.chomp

    while answer.downcase != "p" || answer.downcase != "q"
      if answer == "p"
          #game set up
          puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
          #computer place ships
          #player place ships
          @board = Board.new
          puts @board.render
          puts "Enter the squares for the Cruiser (3 spaces):"
          cruiser_array = gets.chomp #still a string for an answer
          cruiser = Ship.new("Cruiser", 3)
          @board.place(cruiser, cruiser_array.to_a) # this is where an array needs to be passed into the 2nd argument
          puts @board.render(true)
      elsif answer == "q"
        puts "Please remove yourself from the battlefield..."
        break
      else
        puts "Please try again using either p to play or q to quit."
        answer = gets.chomp
      end
    end
  end



end