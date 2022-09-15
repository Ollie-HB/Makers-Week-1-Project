require 'task_tracker'

RSpec.describe "task_tracker method" do
    context "empty string inputted" do
        it "fails" do
        expect{ task_tracker("")}.to raise_error "Error: No sentence entered."
        end
    end

    context "given string containing #TODO on its own" do
        it "returns true" do
            result = task_tracker("#TODO")
            expect(result).to eq true
        end
    end

    context "given a string without '#TODO'" do
        it "returns false" do
            result = task_tracker("Nothing on the agenda for today")
            expect(result).to eq false
        end
    end

        context "given a string containing #TODO: (colon added on to the end)" do
            it "returns true" do
                result = task_tracker(" 1. #TODO: Walk the dog")
                expect(result).to eq true
            end
        end
end