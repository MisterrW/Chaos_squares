class Dice
    # attr_reader :output
    def initialize()
      # output = 1 + rand(400)
    end

    def roll
     return 1 + rand(12)
   end
  end