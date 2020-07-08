require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/contestant"
require "./lib/game"
require "./lib/lottery"

class LotteryTest < Minitest::Test

  def setup
    @lottery = Lottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
      first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

        @alexander.add_game_interest('Pick 4')
        @alexander.add_game_interest('Mega Millions')

    @benjamin = Contestant.new({
      first_name: 'Benjamin',
      last_name: 'Franklin',
      age: 17,
      state_of_residence: 'PA',
      spending_money: 100})

        @benjamin.add_game_interest('Mega Millions')

    @frederick = Contestant.new({
      first_name:  'Frederick',
      last_name: 'Douglas',
      age: 55,
      state_of_residence: 'NY',
      spending_money: 20})

        @frederick.add_game_interest('Mega Millions')

    @winston = Contestant.new({
      first_name: 'Winston',
      last_name: 'Churchill',
      age: 18,
      state_of_residence: 'CO',
      spending_money: 5})

        @winston.add_game_interest('Cash 5')
        @winston.add_game_interest('Mega Millions')


  end

  def test_it_exists
    assert_instance_of Lottery, @lottery
  end

  def test_it_has_attributes
    expected_1 = {}
    expected_2 = []
    expected_3 = {}

    assert_equal expected_1, @lottery.registered_contestant
    assert_equal expected_2, @lottery.winners
    assert_equal expected_3, @lottery.current_contestants

  end

  def test_if_interested_and_18
    require "pry"; binding.pry

    assert_equal true, @lottery.interested_and_18?(@alexander, @pick_4)

  end
end
