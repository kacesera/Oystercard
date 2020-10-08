class JourneyLog
  MIN_FARE = 1

  def initialize(current_journey = Journey, journeys = [])
    @journeys = journeys
    @current_journey = current_journey
  end

  def add_journey(journey = @current_journey)
    @journeys << journey.journey
  end

  def start(entry_station)
    @current_journey = @current_journey.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.complete_journey(exit_station)
    add_journey
  end

  def journeys
    @journeys.dup
  end

  def in_journey?
    @current_journey.in_journey?
  end

  def fare
    return 6 if no_stations?
    MIN_FARE
  end

  private

  def no_stations?
    latest_journey = @journeys[-1]
    !latest_journey[:exit] && latest_journey[:entry].nil?
  end

  def current_journey
    @current_journey ||= Journey
  end
end