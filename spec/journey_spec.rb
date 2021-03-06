require 'journey'
require 'station'

describe Journey do
  let(:entry_station) {double :station, zone: 1}
  let(:exit_station) {double :station, zone: 2}
  let(:journey) {{entry_station: entry_station, exit_station: exit_station}}
# starts journey
it 'starts a journey' do
journey = Journey.new(entry_station)
expect(journey.start_journey(entry_station)).to eq journey.entry_station
end

# ends journey
it 'ends a journey' do
  journey = Journey.new(entry_station)
  expect(journey.end_journey(exit_station)).to eq journey.exit_station
end

it 'knows if a journey is complete' do
  journey = Journey.new(entry_station)
  journey.end_journey(exit_station)
  expect(journey.complete?).to eq true
end

it 'knows if a journey is incomplete' do
  journey = Journey.new(entry_station)
  expect(journey.complete?).to eq false
end

it 'calculates the fare of the journey' do
  journey = Journey.new(entry_station)
  entry_station = Station.new(entry_station, 2)
  exit_station = Station.new(exit_station, 8)
  journey.end_journey(exit_station)
  expect(journey.fare(entry_station, exit_station)).to eq 7
end

it 'calculates the fare of the journey' do
  journey = Journey.new(entry_station)
  entry_station = Station.new(entry_station, 1)
  exit_station = Station.new(exit_station, 9)
  journey.end_journey(exit_station)
  expect(journey.fare(entry_station, exit_station)).to eq 9
end

it 'knows if a journey is incomplete' do
  journey = Journey.new(entry_station)
  entry_station = Station.new(entry_station, 1)
  expect(journey.fare(entry_station, exit_station)). to eq Journey::PENALTY
end

it 'knows if a journey is complete' do
  journey = Journey.new(entry_station)
  entry_station = Station.new(entry_station, 1)
  exit_station = Station.new(exit_station, 1)
  journey.end_journey(exit_station)
  expect(journey.complete?).to eq true
end

it 'has a penalty fare by default' do
  journey = Journey.new(entry_station)
  expect(journey.fare(entry_station, exit_station)).to eq Journey::PENALTY
end

#knows if a journey is complete

# knows if a journey is incomplete by default

# calculates correct penalty/fare




#finish?

#fare

#complete?


end
