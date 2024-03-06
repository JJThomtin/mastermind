class Display
  def display_guess_row(guess, hint)
    return "#{guess.join(" ")}  /  #{hint.join(" ")}"
  end
end