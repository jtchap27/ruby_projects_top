require "yaml"

class Game
  attr_accessor :eligible_words, :game_word, :guess
  def initialize(eligible_words = [], game_word = "", guess = 0)
    @all_words = File.read("10000_words.txt").split("\n")
    @eligible_words = eligible_words
    @all_words.each do |word|
      @eligible_words.push(word) if word.length > 4 && word.length < 13
    end
    @game_word = game_word
    @game_word.empty? ? @game_word = @eligible_words.sample(1).join : @game_word = game_word
    @guess = guess
  end

  def play_round
    @guess += 1
    puts "This is round #{@guess}"
    puts "The game word is #{@game_word}"
    puts "Would you like to save the game? Press 1 to save, 2 to continue without saving."
    save = gets.chomp.to_i
    if save == 1
      yaml = YAML.dump(self)
      File.open("saved_game_file.yaml", "w") do |file|
        file.puts yaml
      end
    else
      play_round
    end
  end
      
end

puts "Would you like to open a saved game? Press 1 for yes:"
open_game = gets.chomp.to_i
if open_game == 1
  game_file = File.read("saved_game_file.yaml")
  yaml = YAML.load(game_file, permitted_classes: [Game])
  resume_game = Game.new(yaml.eligible_words, yaml.game_word, yaml.guess)
  resume_game.play_round
else
  test = Game.new
  test.play_round
end