require_relative('dice.rb')

class Combat
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @dice = Dice.new
  end

  def fight
    puts "#{@player1.name}: roll!"
    player_1_score = @dice.roll
    puts "You rolled #{player_1_score}"
    puts "#{@player2.name}: Roll to beat #{@player1.name}'s score!"
    player_2_score = @dice.roll
    puts "You rolled #{player_2_score}"
    # binding.pry
    if player_1_score > player_2_score
      puts "#{@player1.name} attacks!"
      @player2.stats[:hitpoints] -= @player1.stats[:attack]
      puts "#{@player2.name}, you have taken #{@player1.stats[:attack]} damage! Hitpoints reduced to #{@player2.stats[:hitpoints]}."
    elsif player_2_score > player_1_score
      puts "#{@player2.name} attacks!"
      @player1.stats[:hitpoints] -= @player2.stats[:attack]
      puts "#{@player1.name}, you have taken #{@player2.stats[:attack]} damage! Hitpoints reduced to #{@player1.stats[:hitpoints]}."
    elsif player_2_score ==  player_1_score
      puts "It's a draw!"
    end
    # binding.pry
    current_round()
  end

end