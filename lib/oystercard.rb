class Oystercard
  attr_reader :balance, :status
  DEFAULT_MAX = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @travelling = nil
  end

  def top_up(cash)
    raise "Max balance of #{DEFAULT_MAX} is exceeded" if over_max_balance?(cash)

    add_money(cash)
  end

  def deduct_fare(fare)
    subtract_money(fare)
  end

  def touch_in
    raise "INSUFFICIENT FUNDS" if @balance < MIN_FARE
    @travelling = true
  end

  def in_journey?
    @travelling
  end

  def touch_out
    @travelling = false
  end



  private

  def subtract_money(fare)
    @balance -= fare
  end

  def add_money(cash)
    @balance += cash
  end

  def over_max_balance?(cash)
    (cash + balance) > DEFAULT_MAX
  end

end
