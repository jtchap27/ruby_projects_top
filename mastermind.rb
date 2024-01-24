=begin

display the game board => DONE
  using arrays? 9 arrays, 1 for the codemaker, 8 for the codebreaker => DONE
class for Game, Player, HumanPlayer, ComputerPlayer
computer player makes random code (array of colors to choose from, can't repeat)
get input from human player for each guess of code
  if human guess === code spot, push to another array?
  if human guess === right color but wrong spot, give feedback
stop game when array of === spots is equal to the computer code array

=end

class Game
  def initialize
    code_master = ComputerPlayer.new()
    p code_master.name
    puts "Please enter a name for the human player:"
    code_breaker = HumanPlayer.new(gets.chomp)
    p code_breaker.name
    puts "Please enter four colors in consecutive order:"
    @code_to_break_array = [gets.chomp, gets.chomp, gets.chomp, gets.chomp]
    @guesses_array = [
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
      ["---", "---", "---", "---"],
    ]
    display_game_board
  end

  def display_game_board
    puts "\s\s\s\s\s\s\sCURRENT GAME BOARD\n\n\s\s\sCode #{@code_to_break_array}\n\nGuess 1 #{@guesses_array[0]}\nGuess 2 #{@guesses_array[1]}\nGuess 3 #{@guesses_array[2]}\nGuess 4 #{@guesses_array[3]}\nGuess 5 #{@guesses_array[4]}\nGuess 6 #{@guesses_array[4]}\nGuess 7 #{@guesses_array[6]}\nGuess 8 #{@guesses_array[7]}"
  end

  def display_array_of_guesses
    puts @guesses_array
  end
end

class ComputerPlayer < Game
  attr_accessor :name
  def initialize(name = "Mastermind Computer Player")
    @name = name
  end

end

class HumanPlayer < Game
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

play_game = Game.new
