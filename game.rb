require_relative 'codemaker'
# frozen_string_literal: true

class Game
  include Codemaker
  def initialize
    @role
    @game_continue = true
  end

  def start
    puts 'Welcome to Mastermind'
    @role = pick_starting_role
    gameloop
  end
  
  def gameloop
    while @game_continue
      if @role = "codebreaker"
        player_codebreaker_game
      end
      try_again
    end
  end 

  def player_codebreaker_game
    puts computer_make_code
  end

  #Allows the user to play the game again again
  def try_again
    puts "Do you want to play again"
    puts "Type 'yes' or 'no'"
    loop do
      play_response = gets.chomp
      if play_response.downcase == 'no'
        @game_continue = false
        break
      elsif play_response.downcase == 'yes'
        @game_continue = true
        break
      else
        puts 'Invalid Input'
      end
    end
  end

  # User picks if they want to start as the codemaker or codebreaker
  def pick_starting_role
    puts 'Do you want to start as the Codemaker or the Codebreaker'
    puts "Type 'codemaker' or 'codebreaker' to choose your first role"
    loop do
      role = gets.chomp
      if role.downcase == 'codemaker'
        return 'codemaker'
      elsif role.downcase == 'codebreaker'
        return 'codebreaker'
      else
        puts 'Invalid Input'
      end
    end
  end
end
