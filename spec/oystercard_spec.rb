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

end
