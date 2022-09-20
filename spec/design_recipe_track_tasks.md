1. Describe the Problem

As a user

So that I can keep track of my tasks,
I want a program that I can add todo tasks to and see a list of them.

So that I can focus on tasks to complete,
I want to mark tasks as complete and have them disappear from the list.

2. Design the Class Interface

class TrackTasks
    def initialize  
end 

def add_task(text) 
    #takes string input representing task
end

def list  
    #shows list of all tasks added as strings
    #does not show completed tasks
end

def mark_complete(task) 
    #task is a string representing a task to mark as complete
    #returns nothing
    #fails if the task doesn't exist
end
end


3. Create Examples as Tests

#1 - initialize creates empty list array on startup

context "upon startup" do
    xit "creates empty array" do
        todo = TrackTasks.new
        expect(todo.list).to eq []
    end
 end

 #2 - add_task stores added string in array

 context "when string added" do
    xit "pushes it into @list array" do
        todo = TrackTasks.new
        todo.add_task("clean the car")
        expect(todo.list).to eq ["clean the car"]
    end
end

#3 add_task fails when given empty string

    context "when given empty string" do
        xit "fails" do
            todo = TrackTasks.new
            expect{ todo.add_task("") }.to raise_error "Error: No string added"
        end
    end

#4 - add_task stores multiple strings in array

    context "when more than one string added" do
        xit "stores multiple strings in array" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            todo.add_task("wash the dishes")
            expect(todo.list).to eq ["clean the car", "wash the dishes"]
        end
    end

#5 - mark_complete removes string from array if task entered is already in list

    context "when given a string already in the array" do
        xit "removes string" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            todo.add_task("hoover the floor")
            todo.mark_complete("hoover the floor")
            expect(todo.list).to eq ["clean the car"]
        end
    end

#5 - mark_complete fails if task entered is not in list

    context "when given a string not in the list array" do
        xit "fails" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            expect{ todo.mark_complete("clean the motorbike") }.to raise_error "Error: No such task exists"
        end
    end

4. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.