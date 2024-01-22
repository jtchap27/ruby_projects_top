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
  attr_accessor :player_1, :player_2

  @@board_hash = {
    a1: "-",
    a2: "-",
    a3: "-",
    b1: "-",
    b2: "X",
    b3: "-",
    c1: "-",
    c2: "-",
    c3: "-",
  }

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end



end



def player_1_move
  puts "Player 1: please enter the spot to make your next X like so: \"B3\""
  yx = gets.chomp.downcase.to_sym
  p yx
  board_hash[yx] = "X"
  puts board
  player_2_move(yx)
end

def player_2_move
  puts "Player 2: please enter the spot to make your next O like so: \"B3\""
  yx = gets.chomp.downcase
  board_hash[:yx] = "O"
  puts board
  player_1_move(yx)
end


board = "\nGAME BOARD\n\s\s1 2 3\nA #{board_hash[:a1]} #{board_hash[:a2]} #{board_hash[:a3]}\nB #{board_hash[:b1]} #{board_hash[:b2]} #{board_hash[:b3]}\nC #{board_hash[:c1]} #{board_hash[:c2]} #{board_hash[:c3]}\n\s"



puts board
player_1_move

=begin
player_1 should be a class
player_2 should be a class

methods for picking a spot for X or O

make most methods private or protected so that a player can't access another player's methods

board display of arrays? Use print to make array look horizontal
board should be a class variable

=end