# frozen_string_literal: true

# Codebreaker class is used for when the human player is the Codebreaker while the codebreaker is the codemaker
class Codebreaker
  COLOUR = %w[red orange yellow green blue purple].freeze
  def computer_make_code
    COLOUR.sample(4)
  end
end
