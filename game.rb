require_relative 'board'
class Game
  def initialize
    @game_continue = true
    @starting_roles
    @board = Board.new
  end

  def start
    puts "Welcome to the mastermind game"
    puts color_pegs
    gameloop
  end

  def gameloop
    player_roles = pick_player_role
    while @game_continue
      @game_continue = try_again?
      player_roles = switch_roles(player_roles)
    end
  end

  #pick if player wants to play as the codebreaker or codemaker
  def pick_player_role
    puts "Which side do you want to start at"
    puts "'Codebreaker' or 'Codemaker'"
    loop do
    player_role_choice = gets.chomp
    if player_role_choice.downcase == 'codemaker'
      return "codemaker"
    elsif player_role_choice.downcase == 'codebreaker'
      return "codebreaker"
    else
      puts "Invalid Input"
    end
    end
  end

  #switches player role
  def switch_roles(previous_role)
    if previous_role == "codemaker"
      return "codebreaker"
    else
      return "codemaker"
    end
  end

  #Ask player if they want to play again
  def try_again?
    puts "Do you want to play again? Type 'yes' or 'no'"
    player_choice_repeat = gets.chomp
    if player_choice_repeat.downcase == 'yes'
      return true
    elsif player_choice_repeat.downcase == 'no'
      return false
    else
      puts "Invalid"
    end
  end
end
