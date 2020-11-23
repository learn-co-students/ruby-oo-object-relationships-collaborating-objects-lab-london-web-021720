require 'pry'

class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
       @@all 
    end

    def self.remove_mp3_extension(file)
        file = file.split(".mp3")
        file[0]
    end

    def self.new_by_filename(file)
        file = remove_mp3_extension(file)
        parts = file.split(" - ")
        song = Song.new(parts[1])
        artist = Artist.find_or_create_by_name(parts[0])
        song.artist = artist
        song
    end

    def artist_name=(artist)

        the_artist = Artist.find_or_create_by_name(artist)

        self.artist = the_artist
    end


end