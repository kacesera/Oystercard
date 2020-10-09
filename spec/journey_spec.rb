require 'journey'

describe Journey do
    let(:station) { double :station, zone: 1}
    let(:station_2) { double :station, zone: 1}

    describe "#initialization" do

        it 'initializes @journey with a hash' do 
            expect(subject.journey).to be_a Hash
        end

        it 'intializes @journey with default entry value of nil' do
            expect(subject.journey[:entry]).to eq nil
        end

        it 'starts new journey if given entry_station' do
            new_journey = Journey.new(station)
            expect(new_journey.journey[:entry]).to eq station
        end
    end

    describe "#in_journey?" do

        it 'returns false when not in journey' do
            new_journey = Journey.new(station)
            new_journey.complete_journey(station)
            expect(new_journey.in_journey?).to eq(false)
        end
        
        it 'returns true when in journey' do
            expect(subject.in_journey?).to eq(true)
        end
    end

    describe "#complete_journey" do
        it 'stores the journey in @journey' do
            new_journey = Journey.new(station)
            new_journey.complete_journey(station)
            expect(new_journey.journey).to eq({entry: station, exit: station})
        end
    end

    describe "#fare" do
        before (:each) do
            @journey = Journey.new(station)
            @journey.complete_journey(station_2)
        end
        it "calculates a fare from zone 1 to zone 1" do
            expect(@journey.fare).to eq 1
        end
        it "calculates a fare from zone 1 to zone 2" do
            allow(station_2).to receive(:zone) { 2 }
            expect(@journey.fare).to eq 2
        end
        it "calculates a fare from zone 1 to zone 3" do
            allow(station_2).to receive(:zone) { 3 }
            expect(@journey.fare).to eq 3
        end
        it "calculates a fare from zone 6 to zone 2" do
            allow(station).to receive(:zone) { 6 }
            allow(station_2).to receive(:zone) { 2 }
            expect(@journey.fare).to eq 5
        end
    end

end