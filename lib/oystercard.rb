require_relative "journey"
require_relative "journey_log"

class Oystercard

  attr_reader :balance, :journeys

  DEFAULT_MAX = 90
  MIN_FARE = 1

  def initialize(current_journey=Journey)
    @balance = 0
    @journeys = []
    @current_journey = current_journey
  end

  def top_up(cash)
    over_max_balance?(cash)
    add_money(cash)
  end

  def touch_in(entry_station)
    raise "INSUFFICIENT FUNDS" if insufficient_funds?
    @current_journey = @current_journey.new(entry_station)
  end

  def in_journey?
    @current_journey.in_journey?
  end

  def touch_out(exit_station)
    store_journey(exit_station)
    deduct_fare
    @current_journey = Journey
  end

  private

  def store_journey(exit_station)
    @current_journey.complete_journey(exit_station)
    @journeys << @current_journey.journey
  end

  def insufficient_funds?
    @balance < MIN_FARE
  end

  def deduct_fare(fare = MIN_FARE)
    @balance -= fare
  end

  def add_money(cash)
    @balance += cash
  end

  def over_max_balance?(cash)
    if (cash + balance) > DEFAULT_MAX
      raise "Max balance of #{DEFAULT_MAX} is exceeded"
    end
  end

end
