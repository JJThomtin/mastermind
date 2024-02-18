class Codebreaker
  def initialize(code)
    @code = code
    @colors = ["red", "orange", "yellow", "green", "blue", "purple"]
  end


  #Computer tries to guess the code and returns it
  def computer_code_breaker
    
  end

  #Player tries to guess the code and returns their guess
  def player_code_breaker
    guesses = []
    puts "Enter the color of each peg that you want to guess:"
    puts "Options -->"
    puts "'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'"
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
