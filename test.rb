possible_colors = ["red", "orange", "yellow", "green", "blue", "purple"]
answer = ["red", "unknown", "green", "unknown"]
random_guesses = (0..possible_colors.length-1).to_a.sample(answer.tally["unknown"])
puts random_guesses.inspect