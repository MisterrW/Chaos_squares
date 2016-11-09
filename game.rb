require('pry-byebug')
require_relative('dice')
require_relative('players')
require_relative('chaossquare')

class Game
  attr_reader :turn
  def initialize()
    @dice = Dice.new
  end

  def new_game()
    puts "Welcome to Chaos Squares! How many victims would you like to torment?"
    number_of_players = gets.chomp.to_i
    @players = Array.new(number_of_players, nil)
    @players.each_with_index do |x, y|
      puts "Please enter your name."
      player_name = gets.chomp
      puts "Please choose a race: elf or orc."
      player_race = gets.chomp.downcase
      @players[y] = Player.new(player_name, player_race)
    end
    current_round()
  end

  def current_round()
    for player in @players
      puts "#{player.name}'s turn. Press enter to roll."
      gets.chomp
      player.position += @dice.roll()
      puts "#{player.name} is at position #{player.position}."
      if player.position >= 150
        puts "#{player.name} has won! Play again!"
        exit
      end
      chaos = ChaosSquare.new()
      puts chaos.chaos_effect(player)
    end
    current_round()
  end
end

new_game = Game.new
new_game.new_game()