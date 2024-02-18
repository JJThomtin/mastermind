require_relative 'codemaker'
class Codemaker
  def initialize
    @colors = ["red", "orange", "yellow", "green", "blue", "purple"]
  end
  #Computer creates the code
  def computer_make_code
    [@colors.shuffle.first, @colors.shuffle.first, @colors.shuffle.first, @colors.shuffle.first]
  end

  #Player creates the code 
  def player_make_code
    puts "Codemaker create your code by typing the 4 colors you want to use"
    puts "'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'"
    player_colors = []
    while player_colors.length != 4
      puts "Input Colour #{player_colors.length + 1}"
      player_choice = gets.chomp
      if @colors.include?(player_choice)
        player_colors.push(player_choice)
      else
        puts "Wrong colour"
      end
    end
  end
end
