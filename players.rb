class Player

  attr_reader :name, :number, :race
  def initialize(name, number, race)
    @name = name
    @number = number
    @race = @race_choice[race]
    @position = 1

    @race_choice = {
    "orc" => {
      hitpoints: 20,
      speed: -2,
      attack: 4
    },

    "elf" => {
      hitpoints: 12,
      speed: 2,
      attack: 5
    }
  }
  end



end