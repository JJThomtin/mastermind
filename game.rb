require_relative 'board'
class Game
  def initialize
    puts "Game initialize"
  end

  def start
    puts "Welcome to the mastermind game"
    gameloop
  end

  def gameloop
    starting_roles = pick_player_role
  end

  #pick if player wants to play as the codebreaker or codemaker
  def pick_player_role
    puts "Which side do you want to start at"
    puts "'Codebreaker' or 'Codemaker'"
    loop do
    player_choice = gets.chomp
    if player_choice.downcase == 'codemaker'
      return "codemaker"
    elsif player_choice.downcase == 'codebreaker'
      return "codebreaker"
    else
      puts "Invalid Input"
    end
    end
  end

  #Ask player if they want to play again
  def try_again?
  end

end
