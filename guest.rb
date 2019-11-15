class Guest

attr_reader :name, :money, :fav_song

  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end

  def pay_charge(charge)
    if @money >= charge
      @money -= charge
    else
      return "#{@name} does not have enough money to enter the room"
    end
  end

  def cheer(playlist)
    result = playlist.any? {|song| song.song_name == @fav_song}
      if result
        return "Whoo!"
      else
        return ""
      end
  end
end
