require 'journeylog'

describe Journeylog do
let(:journey_class_double) {double :journey_class}
let(:journey_double) {double :journey_class, new: journey_double}
let(:entry_station) {double :station}
let(:exit_station) {double :station}

  it 'starts with an empty log of journeys by default' do
    journeylog = Journeylog.new(journey_class_double)
    expect(journeylog.journeys). to be_empty
  end

  it 'starts a journey' do
    journeylog = Journeylog.new(journey_class_double)
    allow(journey_class_double).to receive(:new)
    expect(journeylog.start(entry_station)). to eq entry_station
  end

  it 'ends a journey' do
    journeylog = Journeylog.new(journey_class_double)
    allow(journey_class_double).to receive(:new)
    journeylog.start(entry_station)
    expect(journeylog.finish(exit_station)).to eq exit_station
  end

  it 'holds a journey' do
    journeylog = Journeylog.new(journey_class_double)
    allow(journey_class_double).to receive(:new)
    journeylog.start(entry_station)
    journeylog.finish(exit_station)
    journeylog.hold_journey
    expect(journeylog.journeys).to include({entry_station: entry_station, exit_station: exit_station})
  end

end
