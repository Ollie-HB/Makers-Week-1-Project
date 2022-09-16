def get_most_common_letter(text)
    #p counter = Hash.new(0) - creating empty hash
    counter = Hash.new(0)
    # added in '.delete' function to remove spaces from the hash, as we want to find the most common letter
    text.delete(" ").chars.each do |char|
    # p counter[char] += 1 - sequentially counting the occurences of each letter 
    counter[char] += 1
  end
  # p counter.to_a.sort_by { |k, v| v }[0][0] - sorting the occurences of letters as key/values, but in reverse order to our desired output, hence '.reverse'
  # also, giving the first occurence [0][0], which in this case is " ". We want the first letter... hence our '.delete' method on line 5
  counter.to_a.sort_by { |k, v| v }.reverse[0][0]
  end
  
  puts get_most_common_letter("the roof, the roof, the roof is on fire!")
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"