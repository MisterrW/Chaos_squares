require_relative('game')
require_relative('dice')
require_relative('players')
require_relative('chaos_gem')

class Chaos_square

  attr_reader :perks
  def initialize(perks, chaos_gem, dice)
    @perks = perks
    @chaos_gem = ChaosGem.new
    @dice = Dice.new
  end

  def rng()
    square_type = @chaos_gem.roll
    outcome = @dice.roll
    chaos_effect(square_type, outcome)
  end

  def chaos_effect(square_type, outcome)
    case square_type
    when 1..10
      move_player_forward(outcome)
    when 11..20
      move_player_backward(outcome)
    end

  end

  def move_player_forward(outcome)
    current_player.position += outcome
  end

  def move_player_backward(outcome)
    current_player.position -= outcome
  end

end