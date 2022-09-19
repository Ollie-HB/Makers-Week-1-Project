require "grammar_stats"

RSpec.describe GrammarStats do
        it "#initialize - creates counters, 'overall' and 'true'" do
            grammar_check = GrammarStats.new
            expect(grammar_check.counters).to eq 0
        end

    context "#check - when given an empty string" do
        it "fails" do
            grammar_check = GrammarStats.new
            expect{ grammar_check.check("") }.to raise_error "Error: No text entered."
        end
    end

    context "#check - text is capitalized and ends with full stop" do
        it "returns true" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("One two three.")).to eq true
        end
    end

    context "#check - text is capitalized and ends with exclamation mark" do
        it "returns true" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("One two three!")).to eq true
        end
    end

    context "#check - text is capitalized and ends with question mark" do
        it "returns true" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("One two three?")).to eq true
        end
    end

    context "#check - text starts lowercase and ends with appropriate punctuation" do
        it "returns false" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("one two three.")).to eq false
        end
    end

    context "#check - text is capitalized but ends with no punctuation" do
        it "returns false" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("One two three")).to eq false
        end
    end

    context "#check - text starts lowercase and ends with no punctuation" do
        it "returns false" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("one two three")).to eq false
        end
    end

    context "#check - text is capitalized but ends with incorrect punctuation" do
        it "returns false" do
            grammar_check = GrammarStats.new
            expect(grammar_check.check("One two three,")).to eq false
        end
    end

    context "#percentage_good - when given a 50/50 split of true or false values" do
        it "returns 50" do
            grammar_check = GrammarStats.new
            grammar_check.check("One two three.")
            grammar_check.check("one two three")
            expect(grammar_check.percentage_good).to eq 50
        end
    end

    context "#percentage_good - when given all true values" do
        it "returns 100" do
            grammar_check = GrammarStats.new
            grammar_check.check("One two three.")
            grammar_check.check("One two three!")
            grammar_check.check("One two three?")
            expect(grammar_check.percentage_good).to eq 100
        end
    end

    context "#percentage_good - when given all false values" do
        it "returns 0" do
            grammar_check = GrammarStats.new
            grammar_check.check("One two three")
            grammar_check.check("One two three")
            grammar_check.check("One two three")
            expect(grammar_check.percentage_good).to eq 0
        end
    end

    context "#percentage_good - when given 3 true, one false value" do
        it "returns 75" do
            grammar_check = GrammarStats.new
            grammar_check.check("One two three.")
            grammar_check.check("One two three!")
            grammar_check.check("One two three?")
            grammar_check.check("one two three")
            expect(grammar_check.percentage_good).to eq 75
        end
    end
end

