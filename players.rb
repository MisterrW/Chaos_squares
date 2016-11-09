require("pry-byebug")

class Player

  attr_reader :name, :number, :race, :stats
  def initialize(name, number, race)
    @name = name
    @race = race
    @number = number


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

      @stats = @race_choice[race]
      @position = 1



  end
end