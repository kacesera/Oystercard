class Oystercard
  attr_reader :balance, :status
  DEFAULT_MAX = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @travelling = nil
  end

  def top_up(cash)
    over_max_balance?(cash)
    add_money(cash)
  end

  def touch_in
    raise "INSUFFICIENT FUNDS" if insufficient_funds?
    @travelling = true
  end

  def in_journey?
    @travelling
  end

  def touch_out
    deduct_fare
    @travelling = false
    puts "Have a good day!"
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
