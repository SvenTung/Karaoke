require('minitest/autorun')
require('minitest/reporters')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("All Falls Down")
  end

  def test_get_song_name
    assert_equal("All Falls Down", @song1.song_name)
  end
end
