require('minitest/autorun')
require('minitest/rg')
require_relative('game')
require_relative('dice')
require_relative('players')
require_relative('chaos_squares')
require_relative('chaos_gem')

class TestPlayer < Minitest::Test
  def setup()
    @player1 = Player.new('Jeff the unvanquished', 1, 'orc')
    @player2 = Player.new('Jeff the swift', 2, 'elf')
  end

  def test_player_name
    assert_equal(@player1.name, 'Jeff the unvanquished')
  end

  def test_player_breed
    assert_equal(@player1.breed, 'orc')
  end

  def test_player_hitpoints
    assert_equal(@player1.hitpoints, 20)
  end

  def test_player_attack
    assert_equal(@player1.attack, 4)
  end
end