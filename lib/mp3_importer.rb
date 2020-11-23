require 'pry'

class MP3Importer
    @@all = []
    attr_accessor :file

    def initialize(file)
        @file = file
        @@all << self
    end

    def path
        @file
    end

    def files
        files = Dir.glob(path+"/*")
        i = 0
        while i < files.size do
            files[i].slice!("./spec/fixtures/mp3s/")
            i += 1
        end
        files
    end

    def import
        x = self.files
        i = 0
        while i < x.size do
            Song.new_by_filename(x[i])
            i += 1
        end
    end

    def self.all
        @@all
    end
end

