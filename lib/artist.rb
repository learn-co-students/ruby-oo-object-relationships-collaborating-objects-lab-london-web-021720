class Artist

    @@all = []

    attr_accessor :name

    def initialize (artist_name)
        @name = artist_name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(new_artist)
        artist = @@all.find { |artist| artist.name == new_artist}
        if !artist
            Artist.new(new_artist)
        else
            artist
        end
    end

    def print_songs
        songs.each { |song| puts song.name}
    end

end