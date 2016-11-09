require_relative('dice')
require_relative('players')
require_relative('chaos_gem')

class ChaosSquare

  def initialize()
    @chaos_gem = ChaosGem.new
    @dice = Dice.new
    @messages = ["Nothing interesting happens.", "A pretty uneventful turn.", "You fail to invoke the power of the Chaos Gem.", "This game's pretty fun, right?", "You stumble across an ex parrot.", "Wow, this is a dull game.", "You sit down. You stand up. You sit down again.", "Some knights appear. They say 'ni!'.", "What a beautiful day.", "Something will happen soon, honest!", "Are you feeling the chaos yet?", "A Frenchman appears. He calls you a 'smelly English snigget'.", "You encounter a swirling mass of tentacles. You wisely choose to walk around it.", "We probably put too much time into these messages.", "Far in the distance, you spot an African swallow carrying a coconut."]
    @message = rand(@messages.length)
  end

  def chaos_effect(player)
    square_type = @chaos_gem.roll
    outcome = @dice.roll
    if square_type > 300
      puts "You have invoked the power of the Chaos Gem!"
    end
    case square_type
    when 1..200
      return @messages[@message]
    when 201..250
      return move_player_forward(player, outcome)
    when 251..300
      return move_player_backward(player, outcome)
    when 301..350
      return take_damage(player, outcome)
    when 351..400
      return health_boost(player, outcome)
    when 401..450
      return speed_perk(player, outcome)
    end
  end

  def move_player_forward(player, outcome)
    player.position += outcome
    return "Move forward! #{player.name} is now on square #{player.position}"
  end

  def move_player_backward(player, outcome)
    player.position -= outcome
    return "Move backward! #{player.name} is now on square #{player.position}"
  end

  def take_damage(player, outcome)
    damage = (outcome/2).floor
    player.stats[:hitpoints] -= damage
    return "It's only a flesh wound! You have taken #{damage} damage."
  end

  def health_boost(player, outcome)
    boost = (outcome/2).floor
    player.stats[:hitpoints] += boost
    return "You find a shrubbery! You have gained #{boost} health."
  end

  def speed_perk(player, outcome)
    perk = (outcome/12.0)
    player.stats[:speed] += perk
    return "You feel a sudden sense of urgency. Speed permanently increased!"
  end
end