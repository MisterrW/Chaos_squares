require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('combat.rb')
require_relative('players.rb')
require_relative('dice.rb')

class CombatTest < MiniTest::Test
  def setup
    @player1 = Player.new("Jeff", "elf")
    @player2 = Player.new("Bob", "orc")
    @combat = Combat.new(@player1, @player2)
  end

  def test_combat_works
    @combat.fight()

  end

end