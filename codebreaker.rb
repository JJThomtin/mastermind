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
  end

  #Tells the codebreaker if they are correct that the color they guess
  #is in the combination and if that color is in the right spot
  def hint_system(guesses)
    for guess_index in 1..4 do 
      if @code.include?(guesses[guess_index-1])
        #White hint tells the codebreaker that a correct colour peg exist in their guess
        hint = "white"
        if @code[0] == guesses(guess_index)
        if @code[0] == guesses(guess_index)
        if @code[0] == guesses(guess_index)
        if @code[0] == guesses(guess_index)
        end
      end
    end
  end
end
