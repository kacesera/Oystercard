require 'journey_log'

describe JourneyLog do
  let(:completed_journey) { double "Completed Journey" }

  it "initializes @journeys with an empty array" do
    expect(subject.journeys).to be_a Array
    expect(subject.journeys).to be_empty
  end

  describe '#add_journey' do
    it "adds a journey to @journeys" do
      log = JourneyLog.new
      allow(completed_journey).to receive(:journey) { completed_journey }
      log.add_journey(completed_journey)
      expect(log.journeys).to include completed_journey
    end
  end

  describe '#start' do
    it 'creates a new journey' do
      journey_class_double = double(:journey_class)
      log = JourneyLog.new(journey_class_double)
      expect(journey_class_double).to receive(:new)
      log.start("Victoria")
    end
  end

  describe '#finish' do
    it 'adds an exit station to @current_journey' do
      journey_class_double = double(:journey_class)
      log = JourneyLog.new(journey_class_double)
      expect(journey_class_double).to receive(:complete_journey)
      expect(journey_class_double).to receive(:journey)
      log.finish("Victoria")
    end

    it 'adds the current journey to @journeys' do
      journey_class_double = double(:journey_class)
      log = JourneyLog.new(journey_class_double)
      allow(journey_class_double).to receive(:complete_journey)
      allow(journey_class_double).to receive(:journey)
      log.finish("Victoria")
      expect(log.journeys.count).to eq 1
    end
  end

  describe '#journeys' do
    it 'it doesnt modify the original array' do
      double_journeys = double(:journeys)
      log = JourneyLog.new('', double_journeys)
      expect(double_journeys).to receive(:dup)
      log.journeys
    end

    it 'returns the @journeys array' do 
      journey_class_double = double(:journey_class)
      log = JourneyLog.new(journey_class_double)
      allow(journey_class_double).to receive(:complete_journey)
      allow(journey_class_double).to receive(:journey) { journey_class_double }
      log.finish("Victoria")
      expect(log.journeys).to include journey_class_double
    end
  end

  describe '#fare' do
    it 'returns 6 if there is no entry & exit station' do
      allow(subject).to receive(:no_stations?) {true}
      expect(subject.fare).to eq 6
    end
  end
end