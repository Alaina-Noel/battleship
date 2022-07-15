class Game

  def initialize
  end

  def start
    puts "     Welcome to BATTLESHIP!!!! \n Enter p to play. Enter q to quit."
    answer = gets.chomp
    if answer.downcase == "q"
      puts "Thank you for checking in, better luck next time!"
    elsif
      answer == "p"
      #computer place ships
      #player place ships
    end
  end


end