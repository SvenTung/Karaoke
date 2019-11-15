require ("pry")

class Room

  attr_reader :guests, :room_number, :free_space, :tab, :charge

  def initialize(guests, room_number, free_space, playlist, charge)
    @guests = guests
    @room_number = room_number
    @free_space = free_space
    @playlist = playlist
    @tab = 0
    @charge = charge
  end

  def count_songs
    return @playlist.count
  end

  def add_song_to_room_playlist(song)
    @playlist.push(song)
  end

  def add_guest_to_room(guest)
    if @guests.count < @free_space
      @guests.push(guest)
    else
      return "Cannot add #{guest}, the room is full"
    end
  end

  def remove_guest_from_room(guest)
    if @guests.include?(guest)
        @guests.delete(guest)
    else
      return "Could not find #{guest.name} in this room."
    end
  end

  def add_guests_to_room(new_guests)
    if new_guests.count + @guests.count <= @free_space
      @guests.concat(new_guests)
    else
      return "Cannot add guests past the limit of #{@free_space}"
    end
  end

  # function error for loop only loops for the first 2 objects in guests instead of all 4 and leaves 2 left in the room failing the test of removing all 4. Prints the length of the guests array which is 4 yet the counter only counts to 2 and pry ends only after 2 iterations of the for loop.
  # def remove_guests_from_room(guests)
  #   counter = 0
  #   pp guests.length
  #   pp @guests
  #   guests.each do |guest|
  #     if @guests.include?(guest)
  #       @guests.delete(guest)
  #     end
  #     puts counter += 1
  #   end
  # end

  def check_out_all
    @guests.clear
  end

  def add_spending_to_tab(amount)
    @tab += amount
  end
end
