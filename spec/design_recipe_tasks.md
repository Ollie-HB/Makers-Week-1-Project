1. Describe the Problem

As a user

So that I can keep track of my tasks, I want to check if a text includes the string #TODO.

2. Design the Method Signature

task_tracker(text) => boolean (true if text contains '#TODO', false otherwise)

The method doesn't have any other side-effects

3. Create Examples as Tests

# EXAMPLES

1) task_tracker("") -- fails "Error: No sentence entered."    *
2) task_tracker("#TODO") => true
3) task_tracker("Nothing on the agenda for today") => false
4) task_tracker(" 1. #TODO: Walk the dog") => true


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

