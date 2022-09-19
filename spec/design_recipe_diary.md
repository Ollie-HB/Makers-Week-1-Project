1. Describe the Problem

As a user

So that I can count the words of my specific diary entries and work out how long it will take me to read the chunk of text inputted. 

If I don't have enough time to read the text, it will show me what I can read with the time I have, and next time I go to read, it will skip what has already been read, returning the remaining chunk, until the contents is fully read.

the next call after that is from the beginning.

2. Design the Signature

class DiaryEntry

methods: initalize(title, contents), title, contents, count_words, reading_time(wpm), reading_chunk(wpm, minutes)

3. Create Examples as Tests

# EXAMPLES

1) # initalize(title, contents) - constructs title and contents
2) #count_words("my_title", "one two three") => 3
3) #count_words("my_title", "") - "" => 0
4) #reading_time(200) - initialize("my_title", "one" * 500) => 3
5) #reading_time(0) - fails -- "Reading speed must be greater than 0"
6) #reading_chunk(200, 1) - initialize("my_title", "one two three")  => "one two three"
7) #reading_chunk(0, 5) - fails -- "Reading speed must be greater than 0"
8) #reading_chunk(2, 1) - initialize("my_title", "one two three") => "one two"
9) #reading_chunk(2, 1) - #reading_chunk(2, 1) - (remainder) - initialize("my_title", "one two three") => "three"
10) #reading_chunk(2, 1) - #reading_chunk(2, 1) - (restart) - initialize("my_title", "one two three") => "one two"
11) #reading_chunk(2, 1) - #reading_chunk(1, 1) - (restart on exact character) - initialize("my_title", "one two three") => "one two"


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.