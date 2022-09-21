require_relative "../lib/08.diary_entry"

RSpec.describe DiaryEntry do
    context "constructs" do
        it "title and contents of entries" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
            expect(diary_entry.title).to eq "my_title"
            expect(diary_entry.contents).to eq "my_contents"
        end
    end

    describe "#count_words" do
        it "returns word count of entry" do
            monday_entry = DiaryEntry.new("my_title", "I went to the park") 
            expect(monday_entry.count_words).to eq 5
        end

        it "returns 0 if contents empty" do
            diary_entry = DiaryEntry.new("my_title", "")
            expect(diary_entry.count_words).to eq 0
        end
    

        it "returns 1 if contents is one word" do
            diary_entry = DiaryEntry.new("my_title", "one")
            expect(diary_entry.count_words).to eq 1
        end
    end

    describe "#reading_time" do
        it "fails if wpm is zero" do
            monday_entry = DiaryEntry.new("my_title", "I went to the park") 
            expect { monday_entry.reading_time(0) }.to raise_error "WPM must be above 0."
        end

        it "returns 0 if contents empty" do
            diary_entry = DiaryEntry.new("my_title", "")
            expect(diary_entry.reading_time(2)).to eq 0
        end

        it "returns 1 if contents is one word" do
            diary_entry = DiaryEntry.new("my_title", "one")
            expect(diary_entry.count_words).to eq 1
        end
        
        it "returns reading time for contents" do
            monday_entry = DiaryEntry.new("my_title", "my contents are not zero")
            expect(monday_entry.reading_time(2)).to eq 3
        end
    end
end
