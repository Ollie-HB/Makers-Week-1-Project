require 'music_tracker'

RSpec.describe MusicTracker do
    context "upon startup" do
        it "creates empty array" do
            music = MusicTracker.new
            expect(music.list).to eq []
        end
    end
    
    context "when song added" do
        it "pushes it into list array" do
            music = MusicTracker.new
            music.add_song("buffalo soldier")
            expect(music.list).to eq ["buffalo soldier"]
        end
    end
    
    context "when passed an empty string" do
        it "fails" do
            music = MusicTracker.new
            expect{ music.add_song("") }.to raise_error "Error: No string added"
        end
    end

    context "when multiple songs added" do
        it "pushes multiple songs into list array" do
            music = MusicTracker.new
            music.add_song("buffalo soldier")
            music.add_song("true faith")
            expect(music.list).to eq ["buffalo soldier", "true faith"]
        end
    end
    
    context "when given two identical songs" do
        it "only keep one in list" do
            music = MusicTracker.new
            music.add_song("smooth criminal")
            music.add_song("smooth criminal")
            expect(music.list).to eq ["smooth criminal"]
        end
    end
end