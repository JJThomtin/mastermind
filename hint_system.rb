# frozen_string_literal: true

# Helps the codebreaker by giving hints or answers of the
# correct positions and colour of the pegs

module Hint_system
  def hint(guess, answer)
    hint = []
    answer.each_with_index do |element, index|
      if answer.push(guess[index])
        hint.push('white')
        hint[index] = 'red' if element == answer[index]
      else
        hint.push('none')
      end
    end
  end
end
