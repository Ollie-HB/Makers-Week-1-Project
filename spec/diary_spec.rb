require 'diary'

RSpec.describe DiaryEntry do
    it "constructs" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.title).to eq "my_title"
        expect(diary_entry.contents).to eq "my_contents"
    end

describe "#count_words" do
    it "returns the number of words in the contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three ")
        expect(diary_entry.count_words).to eq 3
        end
    end

    it "returns 0 when string is empty" do
        diary_entry = DiaryEntry.new("my_title", "")
        expect(diary_entry.count_words).to eq 0
        end
        
    describe "#reading_time" do
        context "given wpm of a reasonable number (e.g. 200)" do
            it "returns number of minutes required to read the content (rounded-up)" do
            diary_entry = DiaryEntry.new("my_title", "one " * 500)
            expect(diary_entry.reading_time(200)).to eq 3
            end
        end

    context "given wpm of 0" do
        it "fails" do
            diary_entry = DiaryEntry.new("my_title", "one two three ")
            expect{ diary_entry.reading_time(0) }.to raise_error "Reading speed must be greater than 0"
            end
        end
    end

    describe "#reading_chunk" do
        context "given contents that the the user has time to read" do
            it "returns the full contents" do
                diary_entry = DiaryEntry.new("my_title", "one two three ")
                chunk = diary_entry.reading_chunk(200, 1)
                expect(chunk).to eq "one two three"
            end
        end

        context "given wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "one two three ")
                expect{ diary_entry.reading_chunk(0, 5) }.to raise_error "Reading speed must be greater than 0"
                end
            end

        context "given contents that the the user does not have time to read" do
         it "returns chunk of content they can read" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "one two"
            end

            it "returns the remainder of the chunk when asked" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            diary_entry.reading_chunk(2, 1)
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "three"
          end  
          
          it "restarts after full contents is read" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            diary_entry.reading_chunk(2, 1)
            diary_entry.reading_chunk(2, 1)
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "one two" 
          end

          it "restarts is it finishes exactly on the end" do
                diary_entry = DiaryEntry.new("my_title", "one two three")
                diary_entry.reading_chunk(2, 1)
                diary_entry.reading_chunk(1, 1)
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq "one two" 
            end
        end
    end
end


#given contents user does not have time to read