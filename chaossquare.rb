require_relative('dice')
require_relative('players')
require_relative('chaosgem')

class ChaosSquare
  
  def initialize()
    @chaos_gem = ChaosGem.new
    @dice = Dice.new
  end

  # def chaos_effect(player)
  #   square_type = @chaos_gem.roll
  #   outcome = @dice.roll
  # puts "You have invoked the power of the Chaos Gem!" if square_type(301..400)
  #   case square_type
  #   when 1..300
  #     return "nothing interesting happens"
  #   when 301..310
  #     return move_player_forward(player, outcome)
  #   when 311..320
  #     return move_player_backward(player, outcome)
  #   end
  # end

  def move_player_forward(player, outcome)
    player.position += outcome
    return "Move forward! #{player.name} is now on square #{player.position}"
  end

  def move_player_backward(player, outcome)
    current_player.position -= outcome
    return "Move backward! #{player.name} is now on square #{player.position}"
  end

end