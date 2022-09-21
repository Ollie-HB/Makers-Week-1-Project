require_relative '../lib/08.diary'
require_relative  '../lib/08.diary_entry'

RSpec.describe "integration" do
    describe "#all" do
        context "when given one entry" do
            it "returns the entry" do
                diary = Diary.new
                monday_entry = DiaryEntry.new("my_title", "my_contents")
                diary.add(monday_entry)
                expect(diary.all).to eq [monday_entry]
            end
        end

        context "when given multiple entries" do
            it "returns multiple entries" do
                monday_entry = DiaryEntry.new("my_title", "my_contents")
                tuesday_entry = DiaryEntry.new("my_title_1", "my_contents_1")
                diary = Diary.new
                diary.add(monday_entry)
                diary.add(tuesday_entry)
                expect(diary.all).to eq [monday_entry, tuesday_entry]
            end
        end
    end
     
    describe "word counting behaviour" do
            it "returns word count of all diary entries" do
                monday_entry = DiaryEntry.new("my_title", "my contents")
                tuesday_entry = DiaryEntry.new("my_title_1", "my contents 1")
                diary = Diary.new
                diary.add(monday_entry)
                diary.add(tuesday_entry)
                expect(diary.count_words).to eq 5
            end
    end
        
    describe "reading time behaviour" do
        it "fails if wpm is zero" do
            monday_entry = DiaryEntry.new("my_title", "my contents")
            tuesday_entry = DiaryEntry.new("my_title_1", "my contents 1")
            diary = Diary.new
            diary.add(monday_entry)
            diary.add(tuesday_entry)
            expect { diary.reading_time(0) }.to raise_error "WPM must be above 0."
        end

            it "returns the reading time of all entries where it doens't fit exactly" do
                monday_entry = DiaryEntry.new("my_title", "my contents")
                tuesday_entry = DiaryEntry.new("my_title_1", "my contents one")
                diary = Diary.new
                diary.add(monday_entry)
                diary.add(tuesday_entry)
                expect(diary.reading_time(2)).to eq 3
            end

            it "returns the reading time of all entries where it fits exactly" do
                monday_entry = DiaryEntry.new("my_title", "my contents zero")
                tuesday_entry = DiaryEntry.new("my_title_1", "my contents one")
                diary = Diary.new
                diary.add(monday_entry)
                diary.add(tuesday_entry)
                expect(diary.reading_time(2)).to eq 3
            end
        end

    describe "best reading time entry behaviour" do
        it "fails if wpm is zero" do
            diary = Diary.new
            monday_entry = DiaryEntry.new("my_title", "my contents")
            tuesday_entry = DiaryEntry.new("my_title_1", "my contents 1")
            diary.add(monday_entry)
            diary.add(tuesday_entry)
            expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "WPM must be above 0."
        end
        context "given one entry that is readable in time" do
            it "returns that entry" do
                monday_entry = DiaryEntry.new("my_title", "my contents one")
                diary = Diary.new
                diary.add(monday_entry)
                result = diary.find_best_entry_for_reading_time(3, 1)
                expect(result).to eq monday_entry
            end
        end

        context "given one entry that is unreadable in time" do
            it "returns nil" do
                monday_entry = DiaryEntry.new("my_title", "my contents really long")
                diary = Diary.new
                diary.add(monday_entry)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
            end
        end

        context "given more than one entry" do
            it "returns the longest entry you can read in this time" do
                diary = Diary.new
                best_entry = DiaryEntry.new("my_title", "one two")
                diary.add(best_entry)
                diary.add(DiaryEntry.new("my_title", "one"))
                diary.add(DiaryEntry.new("my_title", "one two three"))
                diary.add(DiaryEntry.new("my_title", "one two three four"))
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq best_entry
            end
        end
    end
end
