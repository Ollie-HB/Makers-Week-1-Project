require 'todo'

RSpec.describe Todo do
    it "constructs" do
        item = Todo.new("task")
        expect(item.task).to eq "task"
    end

    context "marking tasks as done" do
        it "adds 'done' to the end of the string" do
            item = Todo.new("task")
            expect(item.mark_done!).to eq "task #done"
        end

        it "fails if empty string given" do
            item = Todo.new("")
            expect { item.mark_done! }.to raise_error "No task provided."
        end
    end

    it "returns true if the task is done" do
        item = Todo.new("task")
        item.mark_done! 
        expect(item.done?).to eq true
    end
end