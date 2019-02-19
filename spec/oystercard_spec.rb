require 'oystercard'
require 'journey'

describe Oystercard do

let(:entry_station) {double :station}
let(:exit_station) {double :station}
let(:journey) {{entry_station: entry_station, exit_station: exit_station}}
  #describe balance on initialize
  it 'checks that the cards balance is 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  #describe top_up
  it 'adds money to balance' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to(:top_up).with(1).argument
    expect{oystercard.top_up(15)}.to change{oystercard.balance}.by 15
  end
  #error if Oystercard::MAXIMUM_BALANCE(£90 is exceeded)
  it 'has raises an error if balance exceeds maximum limit of £90' do
    max_bal = Oystercard::MAXIMUM_BALANCE
    oystercard = Oystercard.new
    oystercard.top_up(max_bal)
    expect{oystercard.top_up 1}.to raise_error "Maximum Oystercard Balance of £#{Oystercard::MAXIMUM_BALANCE} Exceeded"
  end
  #describe deduct do
  it 'deducts correct amount on touch_out when journey is complete' do
    oystercard = Oystercard.new(10)
    expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_CHARGE)
  end
  #touch_in, in_journey?
  it 'recognizes when its in journey' do
    oystercard = Oystercard.new(10,false)
    oystercard.touch_in(entry_station)
    expect(oystercard).to be_in_journey #.to eq true
  end
  #touch_out, in journey?
  it 'recognizes when its in journey' do
    oystercard = Oystercard.new(10,false)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard).not_to be_in_journey #.to eq false
  end
  # error if Oystercard::MINIMUM_BALANCE(£1 is reduced)
  it 'needs £1 to travel' do
    oystercard = Oystercard.new(0.5, false)
    expect{oystercard.touch_in(entry_station)}.to raise_error "Can't travel- need £1"
  end
  #stores an entry_station
  it 'stores the entry station' do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    expect(oystercard.entry_station).to eq entry_station
  end
  #stores journey and exit station
  it 'stores an exit station' do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.exit_station).to eq exit_station
  end
  #journey is empty on default
  it 'stores an empty list of journeys on default' do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    expect(oystercard.journeys).to be_empty
  end

  it 'stores a journey' do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journeys).to include journey
  end

end
