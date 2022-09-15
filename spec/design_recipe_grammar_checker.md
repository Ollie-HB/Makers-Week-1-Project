1. Describe the Problem

As a user

So that I can improve my grammar, 
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.


2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

check_grammar(text) => boolean (text is grammtically correct, i.e. true, or not, i.e. false)

The method won't have any other side-effects

3. Create Examples as Tests

# EXAMPLES

0. check_grammar("") --  fail "Not a sentence." <complete
1. check_grammar("Hello, World!") => true       (Capital + punctuation) <complete
2. check_grammar("Hi, world.") => true          (Capital + punctuation) <complete
3. check_grammar("HEY, WORLD?") => true         (Capital + punctutaion) <complete
4. check_grammar("hello, World!") => false      (No capital, punctuation) <complete
5. check_grammar("Hello, world") => false       (Capital, no full stop) <complete
6. check_grammar("hello, world) => false        (No capital, no punctation) <complete
7. check_grammar("Hello, world,") => false      (Capital, wrong punctuation) <complete


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.