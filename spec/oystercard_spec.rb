require 'oystercard.rb'

describe Oystercard do

  it 'checks that the cards balance is 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end


  it 'adds money to balance' do
    oystercard = Oystercard.new
    #oystercard.top_up(5)
    #oystercard.top_up(15)
    #expect(oystercard.balance).to eq 20
    expect{oystercard.top_up(15)}.to change{oystercard.balance}.by 15
  end

  it 'has raises an error if balance exceeds maximum limit of £90' do
    max_bal = Oystercard::MAXIMUM_BALANCE
    oystercard = Oystercard.new
    oystercard.top_up max_bal
    expect{oystercard.top_up 1}.to raise_error "Maximum Oystercard Balance Exceeded"
  end

  it 'deducts money from balance' do
    oystercard = Oystercard.new
    expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
  end

  it 'recognizes when its in journey' do
    oystercard = Oystercard.new(10,false)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey #.to eq false
  end

  it 'needs £1 to travel' do
    oystercard = Oystercard.new(0.5, false)
    expect{oystercard.touch_in}.to raise_error "Can't travel"
  end

end

#NameError - Unitialized constant Oystercard
#./spec/oystercard_spec.rb:3
#line 3
