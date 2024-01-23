class Game
  attr_accessor :game_over, :player_1_name, :player_2_name

  def initialize
    @game_over = false
    puts "Please enter a name for player 1:"
    @player_1_name = gets.chomp
    puts "Hello #{@player_1_name}, welcome to tic-tac-toe!"
    puts "Please enter a name for player 2:"
    @player_2_name = gets.chomp
    puts "Hello #{@player_2_name}, welcome to tic-tac-toe against #{@player_1_name}!"
    @board_hash = { a1: "-", a2: "-", a3: "-", b1: "-", b2: "-", b3: "-", c1: "-", c2: "-", c3: "-" }
    display_board
    player_1_move_x
  end

  def display_board
    puts "\nGAME BOARD\n\s\s1 2 3\nA #{@board_hash[:a1]} #{@board_hash[:a2]} #{@board_hash[:a3]}\nB #{@board_hash[:b1]} #{@board_hash[:b2]} #{@board_hash[:b3]}\nC #{@board_hash[:c1]} #{@board_hash[:c2]} #{@board_hash[:c3]}\n\s"
  end

  def player_1_move_x
    puts "#{player_1_name}: please enter the spot to make your next X like so: \"B3\""
    spot = gets.chomp.downcase.to_sym
    change_spot_on_board_x(spot)
    display_board
    unless game_over == true
      player_2_move_o
    end
  end

  def player_2_move_o
    puts "#{player_2_name}: please enter the spot to make your next O like so: \"B3\""
    spot = gets.chomp.downcase.to_sym
    change_spot_on_board_o(spot)
    display_board
    unless game_over == true
      player_1_move_x
    end
  end

  private

  def change_spot_on_board_x(sym)
    if @board_hash[sym] == "-"
      @board_hash[sym] = "X"
    else
      puts "\n\t\s\s\s--INVALID INPUT--\n\tPlease pick an empty spot"
      display_board
      player_1_move_x
    end
    unless @board_hash.value?("-")
      game_over_sequence
    end
  end

  def change_spot_on_board_o(sym)
    if @board_hash[sym] == "-"
      @board_hash[sym] = "O"
    else
      puts "\n\t\s\s\s--INVALID INPUT--\n\tPlease pick an empty spot"
      display_board
      player_2_move_o
    end
    unless @board_hash.value?("-")
      game_over_sequence
    end
  end

  def game_over_sequence
    self.game_over = true
    puts "Game over! Play again?"
  end

end

current_game = Game.new