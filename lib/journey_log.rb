class JourneyLog

  def initialize(current_journey = Journey, journeys = [])
    @journeys = journeys
    @current_journey = current_journey
  end

  def add_journey(journey = @current_journey)
    @journeys << journey
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

  private

  def current_journey
    @current_journey ||= Journey
  end
end