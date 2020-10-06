require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

  it 'initializes with a default balance of zero' do
    expect(card.balance).to be_zero
  end

  it 'can have money added to it' do
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  it 'raises error if cash input surpasses default max' do
    default_max = Oystercard::DEFAULT_MAX
    card.top_up(default_max)
    expect { card.top_up 1 }.to raise_error "Max balance of #{default_max} is exceeded"
  end

  it 'deducts fare from the balance' do
    default_max = Oystercard::DEFAULT_MAX
    card.top_up(default_max)
    card.deduct_fare(3)
    expect(card.balance).to eq 87
  end

  describe '#touch_in' do
    it 'changes the @status of the Oystercard to true' do
      card.top_up(5)
      card.touch_in
      expect(card.in_journey?).to be true
    end

    it 'throws an error if user tries to #touch_in with insufficient funds' do
      expect{ card.touch_in }.to raise_error "INSUFFICIENT FUNDS"
    end
  end

  describe '#touch_out' do
    it 'changes the @status of the Oystercard to true' do
      card.top_up(5)
      card.touch_in
      card.touch_out
      expect(card.in_journey?).to be false
    end
  end

end
