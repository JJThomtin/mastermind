# frozen_string_literal: true

require_relative 'human_player'
require_relative 'computer_player'
# Game class runs the game structure for mastermind
class Game
  def initialize
    Human_Player.new
    Computer_Player.new
    @game_continue = true
    @turns = 1
  end

  def start
    puts 'Welcome to Mastermind'
    @role = pick_starting_role
    gameloop
  end

  def gameloop
    while @game_continue
      if @role == 'codebreaker'
        player_codebreaker_game
      else
        player_codemaker_game
      end
      try_again
    end
  end

  def player_codebreaker_game; end

  def player_codemaker_game; end

  # Allows the user to play the game again
  def try_again
    puts 'Do you want to play again'
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
    puts "Do you want to start as the Codemaker or the Codebreaker\n
      Type 'codemaker' or 'codebreaker' to choose your first role"
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
