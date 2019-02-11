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
    expect{oystercard.top_up 15}.to change{oystercard.balance}.by 15
  end

end

#NameError - Unitialized constant Oystercard
#./spec/oystercard_spec.rb:3
#line 3
