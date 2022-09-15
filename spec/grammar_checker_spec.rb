require 'grammar_checker'

RSpec.describe "grammar_checker method" do
    context "given an empty string" do
        it "fails" do
            expect{ grammar_checker("") }.to raise_error "Not a sentence."
        end
    end
    
    context "given string with capital, ending with '!'" do
        it "returns true" do
            result = grammar_checker("Hello, World!")
            expect(result).to eq true
        end
    end

    context "given string with capital, ending with '.'" do
        it "returns true" do
            result = grammar_checker("Hi, world.")
            expect(result).to eq true
        end
    end    

    context "given string in all caps, ending with '?'" do
        it "returns true" do
            result = grammar_checker("HEY WORLD?")
            expect(result).to eq true
        end
    end    

    context "given string with no capital, ending with '!'" do
        it "returns false" do
            result = grammar_checker("hello, World!")
            expect(result).to eq false
        end
    end

    context "given string with capital, ending with no full stop" do
        it "returns false" do
            result = grammar_checker("Hello, world")
            expect(result).to eq false
        end
    end
        
    context "given string with no capital or full stop" do
        it "returns false" do
            result = grammar_checker("hello, world")
            expect(result).to eq false
        end
    end

    context "given string with capital but wrong punctuation ','" do
         it "returns false" do
            result = grammar_checker("Hello, world,")
            expect(result).to eq false
        end
    end
end


