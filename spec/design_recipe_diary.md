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




4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.