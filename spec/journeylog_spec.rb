require 'journeylog'

describe Journeylog do
let(:journey_class_double) {double :journey_class}
let(:journey_double) {double :journey_class, new: journey_double}
let(:entry_station) {double :station}

  it 'starts with an empty log of journeys by default' do
    journeylog = Journeylog.new(journey_class_double)
    expect(journeylog.journeys). to be_empty
  end

  it 'starts a journey' do
    journeylog = Journeylog.new(journey_class_double)
    allow(journey_class_double).to receive(:new)
    expect(journeylog.start(entry_station)). to eq entry_station
  end

  it 'should return an empty journey or create a new journey' do
  
  end

end
