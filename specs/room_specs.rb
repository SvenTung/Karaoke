require('minitest/autorun')
require('minitest/reporters')
require "pp"
require_relative('../guest')
require_relative('../room')
require_relative('../song')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRoom < Minitest::Test

  def setup
    @guest1 = Guest.new("John", 30, "Disarm You")
    @guest2 = Guest.new("Fallon", 54, "Sing me to Sleep")
    @guest3 = Guest.new("Tal", 18, "Shimmer")
    @guest4 = Guest.new("Aria", 39, "Light it up")

    @guest5 = Guest.new("James", 5, "Shelter")
    @guest6 = Guest.new("Kimmi", 75, "To the Moon")

    @guests = [@guest1, @guest2, @guest3, @guest4]
    @new_guests = [@guest5, @guest6]

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

  def test_count_guests
    assert_equal(4, @room1.guests.count)
  end

  def test_check_room_number
    assert_equal(1, @room1.room_number)
  end

  def test_check_free_space
    assert_equal(5, @room1.free_space)
  end

  def test_count_songs
    assert_equal(6, @room1.count_songs)
  end

  def test_check_tab
    assert_equal(0, @room1.tab)
  end

  def test_check_charge
    assert_equal(10, @room1.charge)
  end

  def test_add_song_to_room_playlist
    @room1.add_song_to_room_playlist(@song7)
    assert_equal(7, @room1.count_songs)
  end

  def test_add_guest
    @room1.add_guest_to_room(@guest5)
    assert_equal(5, @room1.guests.count)
  end

  def test_remove_guest
    @room1.remove_guest_from_room(@guest1)
    assert_equal(3, @room1.guests.count)
  end

  def test_remove_guest_not_found
    result = @room1.remove_guest_from_room(@guest6)
    assert_equal("Could not find Kimmi in this room.", result)
  end

  def test_add_guests_to_room_not_enough_free_space
    result = @room1.add_guests_to_room(@new_guests)
    assert_equal("Cannot add guests past the limit of 5", result)
  end

  def test_remove_and_add_new_guests
    @room1.remove_guest_from_room(@guest1)
    @room1.add_guests_to_room(@new_guests)
    assert_equal(5, @room1.guests.count)
  end

  # function error check corresponding room.rb file for details
  # def test_remove_guests_from_room()
  #   pp @guests
  #   @room1.remove_guests_from_room(@guests)
  #   assert_equal(0, @room1.guests.count)
  # end

  def test_check_out_all
    @room1.check_out_all
    assert_equal(0, @room1.guests.count)
  end

  def test_add_spending_to_tab
    @guest2.pay_charge(@room1.charge)
    @room1.add_spending_to_tab(@room1.charge)
    assert_equal(10, @room1.tab)
  end
end
