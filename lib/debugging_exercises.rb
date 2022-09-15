def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end
    ciphertext_chars.join
  end

  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65]
    end
    return plaintext_chars.join
  end

  puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

  # Intended output:
  #
  # > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  # > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  # => "theswiftfoxjumpedoverthelazydog"

=begin

Exercise 1 (from the start)

def say_hello(name)
    return "hello #{name}"
  end
  
puts say_hello("kay")

  # Intended output:
  #
  # > say_hello("kay")
  # => "hello kay"
 
  =end