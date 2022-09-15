require 'words_per_minute'

RSpec.describe "calculate_reading_time method" do
    context "given text of 200 words" do
        it "returns 1" do
            result = calculate_reading_time("text " * 200)
            expect(result).to eq 1
        end
    end

    context "given text of 2000 words" do
        it "returns 10" do
            result = calculate_reading_time("text " * 2000)
            expect(result).to eq 10
        end
    end

    context "when passed empty string" do
        it "returns 0" do
            result = calculate_reading_time("")
            expect(result).to eq 0
        end
    end

    context "when passed a number less than 200" do
        it "returns 1" do
            result = calculate_reading_time("text " * 10)
            expect(result).to eq 1
        end
    end
end

    