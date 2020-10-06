require 'user'

describe User do
  let(:new_user) {User.new}

  it 'creates a new Oystercard' do
    expect(new_user.card).to be_a Oystercard
  end

  describe '#touch_in' do
    it 'changes the @status of the Oystercard to true' do
      new_user.touch_in
      expect(new_user.in_journey?).to be true
    end
  end

  describe '#touch_out' do
    it 'changes the @status of the Oystercard to true' do
      new_user.touch_in
      new_user.touch_out
      expect(new_user.in_journey?).to be false
    end
  end

end