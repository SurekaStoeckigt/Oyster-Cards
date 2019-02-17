require 'oystercard.rb'

describe Oystercard do

let(:station) {double :station}
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
    expect{oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_CHARGE)
  end
  #touch_in, in_journey?
  it 'recognizes when its in journey' do
    oystercard = Oystercard.new(10,false)
    oystercard.touch_in
    expect(oystercard).to be_in_journey #.to eq true
  end
  #touch_out, in journey?
  it 'recognizes when its in journey' do
    oystercard = Oystercard.new(10,false)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey #.to eq false
  end
  # error if Oystercard::MINIMUM_BALANCE(£1 is reduced)
  it 'needs £1 to travel' do
    oystercard = Oystercard.new(0.5, false)
    expect{oystercard.touch_in}.to raise_error "Can't travel- need £1"
  end

  it 'stores the entry station' do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in(station)
    expect(oystercard.entry_station).to eq station
  end

end
