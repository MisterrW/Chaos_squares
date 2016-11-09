class Player

  attr_reader :name, :number, :breed, :hitpoints, :speed, :attack
  def initialize(name, number, breed)
    @name = name
    @number = number
    @breed = breed
    if breed == "orc"
      @hitpoints = 20
      @speed = -2
      @attack = 4
    elsif breed == "elf"
      @hitpoints = 12
      @speed = 2
      @attack = 5
    end
    @position = 1
  end



end