class Diary
    def initialize
        @list = []
    end
  
    def add(entry) 
        @list << entry
    end
  
    def all
      return @list
    end
  
    def count_words
      return @list.sum(&:count_words)
    end
  
    def reading_time(wpm)
      fail "WPM must be above 0." if wpm <= 0
      return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)

      return readable_entries(wpm, minutes).max_by(&:count_words)
    end

  private

  def readable_entries(wpm, minutes)
    return @list.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end