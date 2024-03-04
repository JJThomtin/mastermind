# frozen_string_literal: true

# Codebreaker class is used for the human player and the computer to break the code
class Computer_Player
  COLOUR = %w[red orange yellow green blue purple].freeze
  # Computer returns a peg colour combination
  def computer_make_code
    COLOUR.sample(4)
  end
end
