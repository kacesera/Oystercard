class Journey
    MIN_FARE = 1

    def initialize(entry_station = nil)
        @journey = {entry: entry_station}
    end

    def journey
        @journey
    end

    def in_journey?
        !@journey.has_key?(:exit)
    end

    def complete_journey(station)
        @journey[:exit] = station
    end

    def fare
        station_difference + MIN_FARE
    end

    private

    def station_difference
       diff = @journey[:entry].zone - @journey[:exit].zone
       return diff if diff.positive?
       diff * -1
    end
end