require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

  it 'initializes with a default balance of zero' do
    expect(card.balance).to be_zero
  end

  it 'can have money added to it' do
    card.add_money(5)
    expect(card.balance).to eq 5
  end

end
