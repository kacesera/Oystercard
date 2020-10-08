require 'journey'

describe Journey do
    let(:station) { double :station }

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



end