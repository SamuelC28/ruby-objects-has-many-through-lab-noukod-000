# 
# class Genre
#   attr_accessor :name
# 
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
# 
#   def songs
#     @songs
#   end
# 
#   def artists
#     @songs.collect { |song| song.artist }
#   end
# 
#   def add_song(song)
#     @songs << song
#   end
# end
class Genre
  attr_reader :name, :genre
  attr_accessor :song
  def initialize(name)
    @name = name
  end
  def songs
    Song.all.select do |song|
      song.genre == self
    end
  end
  def artists
    Song.all.map do |song|
      song.artist
    end
  end
end
