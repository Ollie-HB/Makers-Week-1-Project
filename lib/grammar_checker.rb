def grammar_checker(text)
    fail "Not a sentence." if text.empty?
    text.match?(/^[A-Z]/) && text.match?(/\.|\!|\?$/)
end
    
=begin

    first_letter_is_uppercase = text[0] == text[0].upcase 
      last_letter_is_punctuation = [".", "!", "?"].include? text[-1]
    if first_letter_is_uppercase && last_letter_is_punctuation
        return true
    else 
        return false
    end
end

=end
   
