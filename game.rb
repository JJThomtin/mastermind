class Game
  def initialize
    @role 
  end
  
  def start
    puts "Welcome to Mastermind"
    @role = pick_starting_role
    
  end

  #User picks if they want to start as the codemaker or codebreaker
  def pick_starting_role
    puts "Do you want to start as the Codemaker or the Codebreaker"
    puts "Type 'codemaker' or 'codebreaker' to choose your first role"
    loop do 
      role = gets.chomp
      if role.downcase == 'codemaker'
        return 'codemaker'
      elsif role.downcase == 'codebreaker'
        return 'codebreaker'
      else
        puts "Invalid Input"
      end
    end
  end
end