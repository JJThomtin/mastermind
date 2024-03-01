# frozen_string_literal: true

# Codemaker class is used for the player to create the a code and computer to generate a code

class Human_Player
  COLOUR = %w[red orange yellow green blue purple].freeze
  # Player input colours to make the peg combination
  def player_make_code
    puts "You are the codemaker\nNow make your code\nEnter the colour combination for your pegs\n
      `Use 'red', 'orange', 'yellow', 'green', 'blue', 'purple'"
    player_code = []
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

  # Player inputs code
  def player_code_breaker
    player_code = []
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
