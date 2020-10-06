require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }
  let(:mock_station) { double("fake entry station")}

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

  describe '#touch_in' do
    it 'changes the @status of the Oystercard to true' do
      card.top_up(5)
      card.touch_in(mock_station)
      expect(card.in_journey?).to be true
    end

    it 'throws an error if user tries to #touch_in with insufficient funds' do
      expect{ card.touch_in(mock_station) }.to raise_error "INSUFFICIENT FUNDS"
    end

    it "remembers the entry station where the user touched in" do
      card.top_up(10)
      card.touch_in(mock_station)
      expect(card.entry_station).to eq(mock_station)
    end

  end

  describe '#touch_out' do
    it 'changes the @status of the Oystercard to true' do
      card.top_up(5)
      card.touch_in(mock_station)
      card.touch_out
      expect(card.in_journey?).to be false
    end

    it 'says "Have a good day!"' do
      card.top_up(5)
      card.touch_in(mock_station)
      expect { card.touch_out }.to output("Have a good day!\n").to_stdout
    end

    it 'deducts minimum fare from balance' do
      card.top_up(5)
      card.touch_in(mock_station)
      expect { card.touch_out }.to change {card.balance}.by -1
    end

    it 'forgets entry station after touching out' do
      card.top_up(5)
      card.touch_in(mock_station)
      card.touch_out
      expect(card.entry_station).to eq(nil)
    end

  end

end
