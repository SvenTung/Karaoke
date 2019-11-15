require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("John", 30, "Disarm You")
    @guest2 = Guest.new("Fallon", 54, "Sing me to Sleep")
    @guest3 = Guest.new("Tal", 18, "Shimmer")
    @guest4 = Guest.new("Aria", 39, "Light it up")
    @guest5 = Guest.new("James", 5, "Shelter")

    @guests = [@guest1, @guest2, @guest3, @guest4]

    @song1 = Song.new("City of Stars")
    @song2 = Song.new("Disarm You")
    @song3 = Song.new("Light it up")
    @song4 = Song.new("Rewrite the Stars")
    @song5 = Song.new("Wicked Ways")
    @song6 = Song.new("To the Moon")
    @song7 = Song.new("I am falling for you")

    @playlist = [@song1, @song2, @song3, @song4, @song5, @song6]
    @room1 = Room.new(@guests, 1, 5, @playlist, 10)

  end

  def test_room_charge
    @guest1.pay_charge(@room1.charge)
    assert_equal(20, @guest1.money)
  end

  def test_cannot_pay_room_charge
    result = @guest5.pay_charge(@room1.charge)
    assert_equal("James does not have enough money to enter the room", result)
  end

  def test_cheer
    result = @guest4.cheer(@playlist)
    assert_equal("Whoo!", result)
  end

  def test_no_cheer
    result = @guest2.cheer(@playlist)
    assert_equal("", result)
  end
end
