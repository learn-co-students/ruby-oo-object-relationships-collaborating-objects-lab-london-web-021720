require 'pry'
class Artist
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def name
        @name
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.find { |artist| artist.name == name }
            self.all.find { |artist| artist.name == name }
        else
            artist = self.new(name)
        end
    end

    def self.all
        @@all
    end

    def print_songs
        x = Song.all.select{ |song| song.artist == self }
        i = 0
        while i < x.size do
            puts x[i].name
            i += 1
        end
    end
end