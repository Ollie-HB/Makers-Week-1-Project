def calculate_reading_time(text)
    words = text.split(" ")
    word_count = (words.length / 200.to_f).ceil
end