class Codebreaker

  def initialize()
    @computer_previous_guess = []
    @computer_current_guess = []
    @answer = []
    @possible_positions = [true, true, true, true]
    @possible_colors = ["red", "orange", "yellow", "green", "blue", "purple"]
    @colors = ["red", "orange", "yellow", "green", "blue", "purple"]
  end

  #Computer tries to guess the code and returns it
  def computer_code_breaker()
    #Computer's first guess 
    if @computer_current_guess.empty?
      @computer_current_guess = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
      puts "Computer guessed #{@computer_current_guess}"
    end
    @computer_previous_guess = @computer_current_guess
    hints = hint_system(@computer_previous_guess)
    hints.each_with_index {|clue, idx|
      if clue == "red"
        @answer[idx] == @computer_previous_guess[idx]
        @possible_colors.delete(@computer_previous_guess[idx])
      elsif clue == "white"
        @answer[idx] = "unknown"
      else
        @possible_colors.delete(@computer_previous_guess[idx])
        @answer[idx] = "unknown"
      end
    }
    guesses = (0..@possible_colors.length-1).to_a.sample(@answer.tally["unknown"])
    @answer.each { |guess, idx|
      if guess == "unknown"
        @computer_current_guess[@computer_current_guess.findIndex("unknown")] = guesses.pop
      else
        @computer_current_guess[idx] = @answer[idx]
      end
    }
    return @computer_current_guess
  end

  #Player tries to guess the code and returns their guess
  def player_code_breaker
    guesses = []
    puts "Enter the color of each peg that you want to guess:"
    puts "Options -->"
    puts "'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'"
    #Validates if the player guesses in the correct format (4 valid colors)
    while guesses.length < 4
      guess = gets.chomp
      if @colors.include?(guess)
        guesses.push(guess)
        puts "You have guessed #{guesses.join(", ")}"
      else
        puts "Invalid Color"
      end
    end
    guesses
  end

  #Tells the codebreaker if they are correct that the color they guess
  #is in the combination and if that color is in the right spot
  def hint_system(guesses)
    hint_array = []
    for index in 0..3 do 
      #No hint tells the code breaker that a colour peg does not exist in the code
      hint = "none"
      if @code.include?(guesses[index])
        #White hint tells the codebreaker that a colour peg exist in their guess
        hint = "white"
        if @code[index] == guesses[index]
          #Red hint tells the codebreaker that a colour peg in their guess is in the right position
          hint = "red"
        end
      end
      hint_array.push(hint)
    end
    hint_array
  end
end
