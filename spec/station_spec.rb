require 'station'
require 'oystercard'

describe Station do

  it 'exposes the name of the station'do
    station = Station.new("Fifth Avenue", 1)
    expect(station.name). to eq "Fifth Avenue"
  end

  it 'exposes the zone of the station' do
    station = Station.new("Fifth Avenue", 1)
    expect(station.zone).to eq 1
  end

end
