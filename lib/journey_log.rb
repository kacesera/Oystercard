require_relative 'journey'

class JourneyLog
  MIN_FARE = 1
  PENALTY = 6

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
    return PENALTY if no_stations?
    @current_journey.fare
  end

  private

  def no_stations?
    latest_journey = @journeys[-1]
    !latest_journey[:exit] || latest_journey[:entry].nil?
  end

  def current_journey
    @current_journey ||= Journey
  end
end