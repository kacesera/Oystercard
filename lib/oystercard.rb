class Oystercard
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def add_money(cash)
    @balance += cash
  end

end
