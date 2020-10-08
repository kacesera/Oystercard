class Journey
    attr_reader :journey

    def initialize(entry_station = nil)
        @journey = {entry: entry_station}
    end

    def in_journey?
        !@journey.has_key?(:exit)
    end

    def complete_journey(station)
        @journey[:exit] = station
    end
end