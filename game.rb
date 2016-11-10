require('pry-byebug')
require_relative('dice')
require_relative('players')
require_relative('chaos_square')
require_relative('combat')

class Game
  attr_reader :turn
  def initialize()
    @dice = Dice.new
    @board_length = 150
  end

  def intro_spiel()
    return ["Welcome to Chaos Squares!", "Chaos Squares is a board game. There is no board, but there are quite a lot of squares.", "Whoever gets to square #{@board_length} first, wins. Easy!"]
  end

  def player_setup()
    puts "How many victims would you like to torment?"
    number_of_players = gets.chomp.to_i
    unless number_of_players >= 1
      number_of_players = 1
    end
    @players = Array.new(number_of_players, nil)
    @players.each_with_index do |x, y|
      puts "Please enter your name."
      player_name = gets().chomp().capitalize()
      puts "Please choose a race: elf or orc."
      player_race = gets().chomp().downcase()
      @players[y] = Player.new(player_name, player_race)
    end
    current_round()
  end

  def new_game()
    puts intro_spiel()
    player_setup()
  end

  def current_round()
    for player in @players
      puts ""
      puts "#{player.name}'s turn. Press enter to roll."
      gets.chomp
      roll = @dice.roll()
      puts "#{player.name}, you have rolled #{roll}."
      player.position += ( roll * player.stats[:speed] ).round()
      puts player.move_message
      puts "#{player.name} is on square #{player.position}."
      if player.position >= @board_length
        puts "#{player.name} has won CHAOS SQUARES!!!?!1!"
        puts
        quit_game()
      end
      chaos = ChaosSquare.new()
      puts chaos.chaos_effect(player)
      if player.stats[:hitpoints] <= 0
        puts player.death
      end
      # binding.pry
      fight_matcher = @players.delete(player)
      for player2 in fight_matcher
        if player.position == player2.position
          combat = Combat.new(player, player2)
          combat.fight
        end
      end
    end

    current_round()
  end

  def quit_game
    exit
  end

end

new_game = Game.new
new_game.new_game()