# frozen_string_literal: true

# Codemaker class is used for when the human player is the codemaker while the codebreaker is the codebreaker
class Codemaker
  COLOUR = %w[red orange yellow green blue purple].freeze
  def player_make_code
    player_code = []
    puts "You are the codemaker\nNow make your code\nEnter the colour combination for your pegs\n
      `Use 'red', 'orange', 'yellow', 'green', 'blue', 'purple'"
    while player_code.length < 4
      player_colour = gets.chomp
      if COLOUR.include?(player_colour)
        player_code.push(player_colour)
      else
        puts 'Invalid Input'
      end
    end
    player_code
  end
end
