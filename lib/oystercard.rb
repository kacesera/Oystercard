require_relative "journey"
require_relative "journey_log"

class Oystercard

  attr_reader :balance, :journeys

  DEFAULT_MAX = 90
  MIN_FARE = 1

  def initialize(journeys=JourneyLog.new)
    @balance = 0
    @journeys = journeys
  end

  def top_up(cash)
    over_max_balance?(cash)
    add_money(cash)
  end

  def touch_in(entry_station)
    raise "INSUFFICIENT FUNDS" if insufficient_funds?
    @journeys.start(entry_station)
  end

  def in_journey?
    @journeys.in_journey?
  end

  def touch_out(exit_station)
    @journeys.finish(exit_station)
    deduct_fare
  end

  private


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
