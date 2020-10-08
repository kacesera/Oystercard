require 'station'

describe Station do
  let(:station) {Station.new("Victoria", 1)}

  it "has a zone" do
    expect(station.zone).to eq 1
  end

  it "has a name" do 
    expect(station.name).to eq "Victoria"
  end
end