class Player

  attr_reader :name, :number, :stats
  attr_accessor :position, :race
  def initialize(name, race)
    @name = name
    @race = race


    @race_choice = {
      "orc" => {
        race: "Orc",
        hitpoints: 26,
        speed: -2,
        attack: 8
        },

        "elf" => {
          race: "Elf",
          hitpoints: 18,
          speed: 2,
          attack: 4
        }
      }

      @stats = @race_choice[race]
      if @stats == nil
        @stats = {
          race: "Human",
          hitpoints: 22,
          speed: 0,
          attack: 6
        }
      end
      @position = 1

      

  end
end