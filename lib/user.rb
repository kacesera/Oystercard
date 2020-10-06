require_relative 'oystercard'

class User

  attr_reader :card

  def initialize
    @card = Oystercard.new
  end

  def touch_in
    @card.change_status(true)
  end

  def touch_out
    @card.change_status(false)
  end

  def in_journey?
    @card.status
  end
end