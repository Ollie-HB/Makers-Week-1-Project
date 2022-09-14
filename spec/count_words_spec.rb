require 'count_words'

RSpec.describe "count_words method" do
    context "given empty string" do
        it "returns 0" do
            result = count_words("")
            expect(result).to eq 0
        end
    end

    context "given a string with 5 words" do
        it "returns 5" do
            result = count_words("This string has 5 words")
            expect(result).to eq 5
        end
    end
end
