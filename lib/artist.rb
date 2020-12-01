class Artist

    extend Concerns::Findable
  
    attr_accessor :name
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def self.all
      @@all
    end
  
    def self.destroy_all
      @@all.clear
    end
  
    def save
      @@all << self
    end
  
    def self.create(name)
      self.new(name).tap do |artist|
        artist.save
      end
    end
  
    def songs
      @songs
    end
  
   #this sets up the song belongs to the artist association
    def add_song(song)
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
    end
  
    #artist has many genres through songs
    def genres
      genres = @songs.collect do |song|
        song.genre
      end
      genres.uniq
    end
  
  
  
  end






































































# class Artist

#     attr_accessor :name, :songs, :genres
#     @@all = []

#     def initialize(artist)
#         @name = artist
#         @songs = []
#     end

#     def self.all
#         @@all
#     end
    
#     def self.destroy_all
#         @@all = []
#     end

#     def save
#         @@all << self
#     end

#     def self.create(artist)
#         new_artist = self.new(artist)
#         new_artist.save
#         new_artist
#     end

#     def add_song(song)
#         song.artist = self unless song.artist
#         songs << song unless songs.include?(song)
#     end

#     def genres
#     end

# end