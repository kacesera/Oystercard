class Oystercard
  attr_reader :balance
  DEFAULT_MAX = 90

  def initialize
    @balance = 0
  end

  def add_money(cash)
    raise 'Max balance is' + DEFAULT_MAX.to_s if ((cash + balance) > DEFAULT_MAX)

    @balance += cash
  end

end
