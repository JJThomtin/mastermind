# frozen_string_literal: true

require_relative 'human_player'
require_relative 'computer_player'
require_relative 'game_system'
# Game class runs the game structure for mastermind
class Game
  @difficulty_levels = {"Easy" => 14, "Normal" => 10, "Hard" => 6}.freeze
  def initialize
    @hint = []
    @guess = []
    @guess_answer = []
    @human_player = Human_Player.new
    @computer_player = Computer_Player.new
    @game_system = Game_System.new
    @game_continue = true
    @amount_of_rounds = 1
    @amount_of_turns = 1
    @max_rounds = 1
    @max_turns = 1
    @point = {"Player" => 0, "Computer" => 0}
  end

  def start
    puts 'Welcome to Mastermind'
    settings
    gameloop
  end

  def settings
    loop do
      puts "How many rounds do you want to play:"
      @max_rounds = gets.chomp.to_i
      if @max_rounds > 10
        puts "Too many rounds"
      elsif @max_rounds > 0
        break
      else
        puts "Invalid Input"
      end
    end

    puts "#{@max_rounds} rounds in total"
    loop do 
      puts "How many turns do you want to codebreaker to have. Type"
      puts "'Easy' for 14 turns\n'Normal' for 10 turns\n'Hard' for 6 turns"
      difficulty = gets.chomp.to_i
      if difficulty.lower == 'easy'
        @max_turns = @difficulty_levels["Easy"]
        break
      elsif difficulty.lower == 'medium'
        @max_turns = @difficulty_levels["Medium"]
        break
      elsif difficulty.lower == 'hard'
        @max_turns = @difficulty_levels["Hard"]
        break
      else
        puts "Invalid Input"
      end
    end
  end

  def gameloop
    @role = pick_starting_role
    while @game_continue
      while @max_rounds > @amount_of_rounds
        if @role == 'codebreaker'
          player_codebreaker_game
        else
          player_codemaker_game
        end
      end
      try_again
    end
  end

  def player_codebreaker_game
    @answer = @computer_player.computer_make_code
    puts "#{@answer.join("")}"
    until @answer == @guess || @turn < @max_turns do
      @guess = @human_player.player_code_breaker
      hints = @game_system.hint_system(@guess, @answer)
      hints.each_with_index {|hint, index| puts "Hint in Position #{index+1}\n: #{hint}"}
      @turn_amounts = @turn_amounts + 1
    end
    @amount_of_rounds = @amount_of_rounds + 1
  end

  def player_codemaker_game
    @answer = @human_player.player_make_code
    until @answer == @guess || @turn < @max_turns
      sleep(0.5)
      @guess = @computer_player.computer_code_breaker(@hint, @answer)
      sleep(0.5)
      @hint = @game_system.hint_system(@guess, @hint, @answer)

      @turn_amounts = @turn_amounts + 1
    end
    @amount_of_rounds = @amount_of_rounds + 1
  end

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
        settings
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
