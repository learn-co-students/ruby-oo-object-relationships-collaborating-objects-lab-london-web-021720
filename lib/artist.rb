class Artist 
attr_accessor  :name

@all = []
   

    
    def initialize(name)
        @name =name
        @@all << self
    end

    def self.all
        @@all

    end


    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song_name)
        song_name.artist = self
    end


   def self.find_or_create_by_name(artist_name)
        if self.all.find {|artist| artist.name == artist_name}
            return self.all.find {|artist| artist.name == artist_name}
        else
         artist_name = self.new(artist_name)
        end
    end


    def print_songs
       array =  Song.all.select {|songs| songs.artist ==self  }
      array.each {|song_name| puts song_name.name}
        
        # binding.pry 
    end 




end