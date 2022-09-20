class MusicTracker

    def initialize     
        @list = []
    end

    def add_song(song)
        fail "Error: No string added" if song.empty?
        @list << song
    end

    def list
        @list.uniq
    end
end