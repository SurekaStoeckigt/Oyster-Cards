require 'oystercard.rb'

describe Oystercard do

  it 'checks that the cards balance is 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

end

#NameError - Unitialized constant Oystercard
#./spec/oystercard_spec.rb:3
#line 3
