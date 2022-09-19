1. Describe the Problem

As a user

I want to check what percentage of the blocks of text I input are gramatically correct (i.e. start with capital, end with suitable punctuation).

Gramtaically correct strings will return true, otherwise, false, and once all texts have been inputted, I'll be left with an integer representing the percentage of correct strings.


2. Design the Signature

class GrammarStats

methods: counters, check(text), percentage_good

I want to push the boolean results of the grammar check into an array and then find out how many are true, working out the percentage against the total number of elements in the array.

3. Create Examples as Tests

# EXAMPLES


0) #initialize -- creates empty counters <complete
1) #check("") -- fail ("Error: No text entered.) <complete
2) #check("One two three.") => true <complete
3) #check("One two three!") => true <complete
4) #check("One two three?") => true <complete
5) #check("one two three.") => false <complete
6) #check("One two three") => false <complete
7) #check("one two three") => false <complete
8) #check("One two three,") => false <complete
9) #percentage_good - 50/50 split => 50 <complete
10) #percentage_good - all true => 100 <complete
11) #percentage_good - all false => 0 <complete
12) #percentage_good - 3 true, one false => 75 <complete


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.