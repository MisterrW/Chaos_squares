require('pry-byebug')
require_relative('dice')
require_relative('players')
require_relative('chaos_square')

class Game
  attr_reader :turn
  def initialize()
    @dice = Dice.new
    @board_length = 150
  end

  def new_game()
    puts "Welcome to Chaos Squares!" 
    puts "Chaos Squares is a board game. There is no board, but there are quite a lot of squares."
    puts "Whoever gets to square #{@board_length} first, wins. Easy!"
    puts "How many victims would you like to torment?"
    number_of_players = gets.chomp.to_i
    unless number_of_players >= 1
      number_of_players = 1
    end
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
      puts ""
      puts "#{player.name}'s turn. Press enter to roll."
      gets.chomp
      player.position += ( @dice.roll() * player.stats[:speed] ).round()
      puts player.move_message
      puts "#{player.name} is on square #{player.position}."
      if player.position >= @board_length
        puts "OMG #{player.name} HAS WON CHAOS SQUARES!!!?!1! WTF!?!?1?? play again SOON!"
        puts 'BYE!!'
        quit_game()
      end
      chaos = ChaosSquare.new()
      puts chaos.chaos_effect(player)
      if player.stats[:hitpoints] <= 0
        puts player.death
      end
      # binding.pry
    end
    current_round()
  end

  def quit_game
    exit
  end

end

new_game = Game.new
new_game.new_game()