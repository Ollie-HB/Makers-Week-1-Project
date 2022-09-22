require 'todo'
require 'todo_list'

RSpec.describe "Todo integration" do
    describe 'add' do
        context "When given a todo item" do
            it "stores the item in an array" do
                item = Todo.new("task")
                list = TodoList.new
                expect(list.add(item)).to eq [item]
            end
        end
    end

    describe "incomplete behaviour" do
        context "when given an array full of incomplete tasks" do
            it "returns the full array" do
                item = Todo.new("task")
                item1 = Todo.new("task1")
                list = TodoList.new
                list.add(item)
                list.add(item1)
                expect(list.incomplete).to eq [item, item1]
            end
        end
    end

    context "when given an array full of complete tasks" do
        it "returns an empty array" do
            item = Todo.new("task")
            item1 = Todo.new("task1")
            item.mark_done!
            item1.mark_done!
            list = TodoList.new
            list.add(item)
            list.add(item1)
            expect(list.incomplete).to eq []
        end
    end

    context "when given an array full of mixed tasks" do
        it "returns an array of incomplete tasks" do
            item = Todo.new("task")
            item1 = Todo.new("task1")
            item2 = Todo.new("task2")
            item.mark_done!
            item1.mark_done!
            list = TodoList.new
            list.add(item)
            list.add(item1)
            list.add(item2)
            expect(list.incomplete).to eq [item2]
        end
    end

    describe "complete behaviour" do
        context "when given an array full of complete tasks" do
            it "returns the full array" do
                item = Todo.new("task")
                item1 = Todo.new("task1")
                item.mark_done!
                item1.mark_done!
                list = TodoList.new
                list.add(item)
                list.add(item1)
                expect(list.complete).to eq [item, item1]
            end
        end

        context "when given an array full of incomplete tasks" do
            it "returns an empty array" do
                item = Todo.new("task")
                item1 = Todo.new("task1")
                list = TodoList.new
                list.add(item)
                list.add(item1)
                expect(list.complete).to eq []
            end
        end

        context "when given an array mixed with complete/incomplete tasks" do
            it "returns the complete tasks" do
                item = Todo.new("task")
                item1 = Todo.new("task1")
                item2 = Todo.new("task2")
                item.mark_done!
                item1.mark_done!
                list = TodoList.new
                list.add(item)
                list.add(item1)
                list.add(item2)
                expect(list.complete).to eq [item, item1]
            end
        end
    end

    describe "give up behaviour" do
        it "marks all incomplete tasks as #done" do
            item = Todo.new("task")
            item1 = Todo.new("task1")
            item2 = Todo.new("task2")
            list = TodoList.new
            list.add(item)
            list.add(item1)
            list.add(item2)
            expect(list.give_up!).to eq [item, item1, item2]
        end
    end  
end


