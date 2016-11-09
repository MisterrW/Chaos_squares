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
        attack: 8,
        move_messages: ["#{@name} stamps along, dragging his axe behind him.", "'I wonder why my skin's green? Do I photosynthesize?' #{@name} philosophises, passing the time.", "#{@name} walks past a tasty-looking human. Oh well, no time to eat now.", "#{@name} stamps extra hard. He has special stamping boots. Probably DMs."]
        },

        "elf" => {
          race: "Elf",
          hitpoints: 18,
          speed: 2,
          attack: 4,
          move_messages: ["#{@name} strides along, his pointy ears flapping in the breeze.", "'This journey is taking forever', thinks #{@name} as he walks. Luckily, #{@name} lives forever.", "#{@name} sighs. So much walking. So many tentacles.", "Fleet of foot, #{@name} prances along.", "#{@name} whistles irritating tunes as he strides."]
        }
      }

      @stats = @race_choice[race]
      if @stats == nil
        @stats = {
          race: "Human",
          hitpoints: 22,
          speed: 0,
          attack: 6,
          move_messages: ["#{@name} hopes there aren't any orcs nearby.", "'Why did I agree to play this game in the first place?', #{@name} wonders. One sympathises.", "'Got to keep going, #{@name}', he says to himself. There must be something bloody brilliant at the end.", "'Was that a pair of European swallows with a tropical fruit suspended between them?', muses #{@name}, to take his mind off the endless walking."]
        }
      end
      @position = 1

    
  end

  def move_message
    pick_message = rand(@stats[:move_messages].length())
    message = @stats[:move_messages][pick_message]
    # @stats[:move_messages].unshift(message)
    return message
  end

  def death
    @position = 1
    if @stats[:race] != "Zombie"
      @stats = {
        race: "Zombie",
        hitpoints: 10,
        speed: -10,
        attack: 4,
        move_messages: ["Head bowed, mind blank, #{@name} shuffles on.", "#{@name} wonders why he's walking so slowly. He looks down, to find that one of his feet has been eaten by a badger.", "#{@name} is sure he had a good reason for playing this game, once.", "'Eeuuueueeuughh', #{name} wails plaintively. Nobody hears."]

      }
      return "Sorry, #{@name}, you have died! But always look on the bright side...you've come back. As a zombie. On square one. And remember: zombies are slooow."
    else
      @stats = {
        race: "Fast Zombie",
        hitpoints: 100,
        speed: 20,
        attack: 40,
        move_messages: ["#{name} sprints along, shrieking horribly.", "Venom flies from #{name}'s mouth. They'll pay...they'll all pay...", "#{name} pauses momentarily when he thinks he sees the Messiah, only to realise it's a very naughty boy."]
      }
      return "Wow, dead again. Back to square one, again. You really suck at this game. Here, have a leg up, you hideous, shambling corpse..."
    end
  end




end