class DiaryEntry
    def initialize(title, contents) 
        @title = title
        @contents = contents
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      return 0 if @contents.empty?
      return @contents.count(" ") + 1
    end
  
    def reading_time(wpm)
      fail "WPM must be above 0." if wpm <= 0
      (count_words / wpm.to_f).ceil
    end
  end