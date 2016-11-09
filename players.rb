class Player

  attr_reader :name, :number, :stats
  attr_accessor :position, :race
  def initialize(name, race)
    @name = name
    @race = race


    @race_choice = {
      "orc" => {
        race: "Orc",
        hitpoints: 1,
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

  def death
    @position = 1
    if @stats[:race] != "Zombie"
      @stats = {
        race: "Zombie",
        hitpoints: 10,
        speed: -10,
        attack: 4
      }
      return "Sorry, #{@name}, you have died! But always look on the bright side...you've come back. As a zombie. On square one. And remember: zombies are slooow."
    else
      @stats = {
        race: "Fast Zombie",
        hitpoints: 100,
        speed: 20,
        attack: 40
      }
      return "Wow, dead again. Back to quare one, again. You really suck at this game. Here, have a leg up, you hideous, shambling corpse..."
    end
  end




end