# frozen_string_literal: true

# Does game logic for the program
class Game_System
  # Helps the codebreaker by giving hints or answers of the
  # correct positions and colour of the pegs
  def hint_system(guess, answer)
    hint = []
    answer.each_with_index do |element, index|
      if answer.include?("#{guess[index]}")
        # White tells the codebreaker that color peg exists in the code
        hint.push('white')
        # Red tells the codebreaker that the color peg placement at index is correct
        hint[index] = 'red' if element == guess[index]
      else
        # None tells the codebreaker that the color peg does not exists
        hint.push('none')
      end
    end
    hint
  end
end
