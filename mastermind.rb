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
  attr_reader :code_breaker
  def initialize
    code_master = ComputerPlayer.new()
    p code_master.name
    puts "Please enter a name for the human player:"
    code_breaker = HumanPlayer.new(gets.chomp.capitalize)
    @code_breaker = code_breaker.name
    @array_of_colors = ["blue", "green", "white", "red", "black", "purple"]
    @code_to_break_array = @array_of_colors.sample(4)
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
    @feedback_array = [
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      []
    ]
    puts "Feedback explained: \"C\" means correct color and location, while \"c\" means correct color but wrong location."
    display_game_board
  end

  def make_guess
    i = @guesses_array.length - 1
    while i >= 0 do
      k = 0
      while k <= 3 do
        # individual round guess loop
        puts "#{@code_breaker}, you have #{i + 1} guesses remaining. please guess color #{k + 1}:"
        @guesses_array[i][k] = gets.chomp.downcase
        k += 1
      end
      feedback_array_to_push = []
      j = 0
      while j <= 3 do
        # feedback loop
        if @guesses_array[i][j] == @code_to_break_array[j]
          feedback_array_to_push.push(" C ")
        elsif @code_to_break_array.include?(@guesses_array[i][j])
          feedback_array_to_push.push(" c ")
        else
          feedback_array_to_push.push(" - ")
        end
        j += 1
      end
      @feedback_array[i].push(feedback_array_to_push.shuffle)
      display_game_board
      if @guesses_array[i] == @code_to_break_array
        game_over_sequence
        break
      else
        i -= 1
      end
    end
    puts "You did not break the code. Better luck next time.\n\s"
  end
  
  def play_a_game
    make_guess
  end

  def game_over_sequence
    puts "\nWell done #{@code_breaker}! You broke the code!\n\s"
  end

  def display_game_board
    puts "\s\s\s\s\s\s\sCURRENT GAME BOARD\n\n\s\s\sCode #{@code_to_break_array}\n\nGuess 8 #{@guesses_array[0]}\s\s#{@feedback_array[0]}\nGuess 7 #{@guesses_array[1]}\s\s#{@feedback_array[1]}\nGuess 6 #{@guesses_array[2]}\s\s#{@feedback_array[2]}\nGuess 5 #{@guesses_array[3]}\s\s#{@feedback_array[3]}\nGuess 4 #{@guesses_array[4]}\s\s#{@feedback_array[4]}\nGuess 3 #{@guesses_array[5]}\s\s#{@feedback_array[5]}\nGuess 2 #{@guesses_array[6]}\s\s#{@feedback_array[6]}\nGuess 1 #{@guesses_array[7]}\s\s#{@feedback_array[7]}\n\nColors to choose from: #{@array_of_colors}\n\n"
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

mm_round = Game.new
mm_round.play_a_game
