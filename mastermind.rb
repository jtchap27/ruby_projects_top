module GamePlayable
  def set_code_to_break_array
    puts "Please type in 4 consecutive colors from the options of:\n---, blue, green, white, red, black, purple.\nYou may reuse colors and use the \"---\" to indicate a blank space.\nPress enter after typing each color."
    return [[gets.chomp], [gets.chomp], [gets.chomp], [gets.chomp]]
  end

  def get_array_of_colors_easy_med_hard(n)
    if n == 1
      ["blue", "green", "white", "red", "black", "purple"]
    elsif n == 2
      ["blue", "blue", "blue", "blue", "green", "green", "green", "green", "white", "white", "white", "white", "red", "red", "red", "red", "black", "black", "black", "black", "purple", "purple", "purple", "purple"]
    else
      ["---", "---", "---", "---", "blue", "blue", "blue", "blue", "green", "green", "green", "green", "white", "white", "white", "white", "red", "red", "red", "red", "black", "black", "black", "black", "purple", "purple", "purple", "purple"]
    end
  end
end


class Game
  include GamePlayable
  attr_reader :code_maker, :code_breaker
  def initialize
    puts "Welcome to Mastermind!\nPlease select whether you would like to play as the code maker or code breaker.\nType in 1 for code maker, 2 for code breaker."
    @code_deciding_number = gets.chomp.to_i
    # for playing with human as code maker
    if @code_deciding_number == 1
      puts "Please enter a name for the human code maker:"
      code_maker = HumanPlayer.new(gets.chomp.capitalize)
      code_breaker = ComputerPlayer.new()
      @code_to_break_array = set_code_to_break_array
    # for playing with comp as code maker
    else
      code_maker = ComputerPlayer.new()
      puts "\nPlease enter a name for the human code breaker:"
      code_breaker = HumanPlayer.new(gets.chomp.capitalize)

      puts "\nPlease select easy, medium, or hard game play mode.\n\t- In easy mode, the computer picks a code from 6 colors with no repeats.\n\t- In medium mode, the computer picks a code from 6 colors with repeats.\n\t- In hard mode, the computer picks a code from 6 colors with repeats and blank spaces.\n\nType 1 for easy, 2 for medium, or 3 for hard."

      @game_play_mode = gets.chomp.to_i
      if @game_play_mode == 1
        @array_of_colors = get_array_of_colors_easy_med_hard(1)
      elsif @game_play_mode == 2
        @array_of_colors = get_array_of_colors_easy_med_hard(2)
      else
        @array_of_colors = get_array_of_colors_easy_med_hard(3)
      end

      @code_to_break_array = @array_of_colors.sample(4)
    end
    @code_maker = code_maker.name
    @code_breaker = code_breaker.name
    @guesses_array = [
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "],
      [" X ", " X ", " X ", " X "]
    ]
    @feedback_array = [[], [], [], [], [], [], [], [], [], []]

    puts "\nFeedback explained: \"C\" means correct color and location, while \"c\" means correct color but wrong location."

    display_game_board
  end

  def play_a_game
    if @code_deciding_number == 1
      i = @guesses_array.length - 1
      while i >= 0 do
        k = 0
        while k <= 3 do
          # automated guess loop targeting single element of array in guesses_array
          @guesses_array[i][k] = get_array_of_colors_easy_med_hard(3).sample(1)
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
        @feedback_array[i].push(feedback_array_to_push)
        if @guesses_array[i] == @code_to_break_array
          game_over_sequence
          break
        else
          i -= 1
        end
      end
      if @guesses_array[0][3] != nil
        display_game_board
        puts "\n\t#{@code_breaker}, you did not break the code shown below. #{@code_maker} is victorious! Better luck next time.\n\s"
      end
      puts "\t\t#{@code_to_break_array}\n\s\n\s"
    else
      i = @guesses_array.length - 1
      while i >= 0 do
        k = 0
        while k <= 3 do
          # individual round guess loop
          puts "\n#{@code_breaker}, you have #{i + 1} guesses remaining. Please guess color #{k + 1}:"
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
        @feedback_array[i].push(feedback_array_to_push)
        display_game_board
        if @guesses_array[i] == @code_to_break_array
          game_over_sequence
          break
        else
          i -= 1
        end
      end
      puts "You did not break the code. Better luck next time.\n\s" unless @feedback_array[0][3] == nil
      puts "\n\t\t\t#{@code_to_break_array}\n\s\n\s"
    end
  end

  def game_over_sequence
    puts "\n\t\tWell done #{@code_breaker}! You broke the code shown below!"
  end

  def display_game_board
    puts "\n\s\s\s\s\s\s\sCURRENT GAME BOARD\n\n\s\s\s\sCode     X      X      X      X\n\nGuess 10 #{@guesses_array[0]}\s\s#{@feedback_array[0]}\nGuess 9  #{@guesses_array[1]}\s\s#{@feedback_array[1]}\nGuess 8  #{@guesses_array[2]}\s\s#{@feedback_array[2]}\nGuess 7  #{@guesses_array[3]}\s\s#{@feedback_array[3]}\nGuess 6  #{@guesses_array[4]}\s\s#{@feedback_array[4]}\nGuess 5  #{@guesses_array[5]}\s\s#{@feedback_array[5]}\nGuess 4  #{@guesses_array[6]}\s\s#{@feedback_array[6]}\nGuess 3  #{@guesses_array[7]}\s\s#{@feedback_array[7]}\nGuess 2  #{@guesses_array[8]}\s\s#{@feedback_array[8]}\nGuess 1  #{@guesses_array[9]}\s\s#{@feedback_array[9]}\n\nColors to choose from: blue, green, white, red, black, purple (and --- if playing on hard mode)\n"
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