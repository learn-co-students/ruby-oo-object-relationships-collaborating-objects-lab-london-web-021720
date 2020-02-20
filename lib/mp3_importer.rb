require 'pry'

class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def extract_mp3_files
        array_of_files = []
        Dir.foreach(path) do |filename|
            if filename.include?(".mp3")
                array_of_files << filename
            end
        end
        array_of_files
    end



    def files
        array_of_files = extract_mp3_files
    end

    def import
        file_array = files
        file_array.each do |file|
            Song.new_by_filename(file)
        end
    end

end