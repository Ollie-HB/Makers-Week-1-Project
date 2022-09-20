1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.


2. Design the Class Interface

class MusicTracker

    def initialize     
        # sets up empty array
    end

    def add_song(song)
        #fails if passed empty string
        #takes string input representing a song
    end

    def list
        #shows list of all songs added
        #no duplicates
    end
end

3. Create Examples as Tests

#1 initialize creates empty list array on startuo

context "upon startup" do
    xit "creates empty array" do
        music = MusicTracker.new
        expect(music.list).to eq []
    end
end

#2 add_song stores added song in list array

context "when song added" do
    xit "pushes it into list array" do
        music = MusicTracker.new
        music.add_song("buffalo soldier")
        expect(music.list).to eq ["buffalo soldier"]
    end
end

#3 add_song fails when given an empty string

context "when passed an empty string" do
    xit "fails" do
        music = MusicTracker.new
        expect{ music.add_song("") }.to raise_error "Error: No string added"
    end
end

#4 add_song stores multiple songs in list

context "when multiple songs added" do
    xit "pushes multiple songs into list array" do
        music = MusicTracker.new
        music.add_song("buffalo soldier")
        music.add_song("true faith")
        expect(music.list).to eq ["buffalo soldier", "true faith"]
    end
end

#5 add_song pushed no duplicates

context "when given two identical songs" do
    xit "only keep one in list" do
        music = MusicTracker.new
        music.add_song("smooth criminal")
        music.add_song("smooth criminal")
        expect(music.list).to eq ["smooth criminal"]
    end
end

4. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.