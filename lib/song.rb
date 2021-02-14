class Song 
    attr_accessor :name, :artist
    
 

    @@all = []
  
      def initialize(name)
          @name = name
          @@all << self
      end 

      def self.all
        @@all
      end

      def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = self.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0])
        song.artist = artist
        song
      end

      def artist_name=(artist_name)
        #binding.pry
        @artist_name = Artist.find_or_create_by_name(artist_name)
        @artist_name.add_song(self)
      end
end