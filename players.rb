require("pry-byebug")

class Player

  attr_reader :name, :number, :race, :stats
  attr_accessor :position
  def initialize(name, race)
    @name = name
    @race = race


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