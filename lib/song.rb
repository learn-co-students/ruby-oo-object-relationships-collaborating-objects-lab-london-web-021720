require 'pry'


class Song
    @@all = []
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def name=(name)
        @name = name
    end

    def artist=(artist)
        @artist = artist
    end

    def artist
        @artist
    end

    def artist_name=(name)
        x = Artist.find_or_create_by_name(name)
        self.artist = x
        x.add_song(self)
    end

    def self.new_by_filename(file)
        x = file.split(" - ")
        song_name = x[1]
        artist_name = x[0]
        song = Song.new(song_name)
        song.artist_name = artist_name
        song
    end

    def self.all
        @@all
    end
end