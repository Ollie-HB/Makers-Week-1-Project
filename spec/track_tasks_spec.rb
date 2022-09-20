require 'track_tasks'

RSpec.describe TrackTasks do

    context "upon startup" do
        it "creates empty array" do
            todo = TrackTasks.new
            expect(todo.list).to eq []
        end
    end

    context "when string added" do
        it "pushes it into @list array" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            expect(todo.list).to eq ["clean the car"]
        end
    end

    context "when given empty string" do
        it "fails" do
            todo = TrackTasks.new
            expect{ todo.add_task("") }.to raise_error "Error: No string added"
        end
    end

    context "when more than one string added" do
        it "stores multiple strings in array" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            todo.add_task("wash the dishes")
            expect(todo.list).to eq ["clean the car", "wash the dishes"]
        end
    end

    context "when we complete a task in the list" do
        it "removes task" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            todo.add_task("hoover the floor")
            todo.mark_complete("hoover the floor")
            expect(todo.list).to eq ["clean the car"]
        end
    end

    context "when we try and complete a non-listed task" do
        it "fails" do
            todo = TrackTasks.new
            todo.add_task("clean the car")
            expect{ todo.mark_complete("clean the motorbike") }.to raise_error "Error: No such task exists"
        end
    end
end