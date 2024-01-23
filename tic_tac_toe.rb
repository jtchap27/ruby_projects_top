=begin
class Player
  
  def make_a_move(x, y)
    x = x axis
    y = y axis
    check if there are 3 in a row
      if true, game is over
  end

need a Game class?
  initialize(player_1, player_2)
need Player class (< Game?)


end
=end

class Game
  attr_accessor :player_1_name, :player_2_name

  def initialize
    puts "Please enter a name for player 1:"
    @player_1_name = gets.chomp
    puts "Hello #{@player_1_name}, welcome to tic-tac-toe!"
    puts "Please enter a name for player 2:"
    @player_2_name = gets.chomp
    puts "Hello #{@player_2_name}, welcome to tic-tac-toe against #{@player_1_name}!"
    @board_hash = { a1: "-", a2: "-", a3: "-", b1: "-", b2: "-", b3: "-", c1: "-", c2: "-", c3: "-" }
    display_board
  end

  # @winning_board_hash_array = [[@board_hash[a1]],

  def display_board
    puts "\nGAME BOARD\n\s\s1 2 3\nA #{@board_hash[:a1]} #{@board_hash[:a2]} #{@board_hash[:a3]}\nB #{@board_hash[:b1]} #{@board_hash[:b2]} #{@board_hash[:b3]}\nC #{@board_hash[:c1]} #{@board_hash[:c2]} #{@board_hash[:c3]}\n\s"
  end

  def change_spot_on_board_X(sym)
    if @board_hash[sym] == "-"
      @board_hash[sym] = "X"
    else
      puts "\n\t\s\s\s--INVALID INPUT--\n\tPlease pick an empty spot"
      self.display_board
      self.player_1_move
    end
  end

  def change_spot_on_board_O(sym)
    if @board_hash[sym] == "-"
      @board_hash[sym] = "O"
    else
      puts "\n\t\s\s\s--INVALID INPUT--\n\tPlease pick an empty spot"
      self.display_board
      self.player_2_move
    end
  end

  def player_1_move
    puts "#{self.player_1_name}: please enter the spot to make your next X like so: \"B3\""
    spot = gets.chomp.downcase.to_sym
    self.change_spot_on_board_X(spot)
    self.display_board
    self.player_2_move
  end

  def player_2_move
    puts "#{self.player_2_name}: please enter the spot to make your next O like so: \"B3\""
    spot = gets.chomp.downcase.to_sym
    self.change_spot_on_board_O(spot)
    self.display_board
    self.player_1_move
  end

end

=begin
class Player < Game
  def initialize
  end
end
=end

current_game = Game.new
current_game.player_1_move