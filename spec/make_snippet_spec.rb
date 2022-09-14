require 'make_snippet'

RSpec.describe 'make_snippet method' do
    context "given an empty string" do
        it "returns an empty string" do
            result = make_snippet("")
            expect(result).to eq ""
        end
    end

    context "given a string of five words" do
        it "returns the string" do
            result = make_snippet("this string is five words")
            expect(result).to eq "this string is five words"
        end
    end

    context "given string longer than five" do
        it "returns string and adds '...'" do
            result = make_snippet("this string is longer than five words")
            expect(result).to eq "this string is longer than ..."
        end
    end
end