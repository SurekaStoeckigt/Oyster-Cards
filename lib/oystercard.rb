
class Oystercard
attr_reader :balance, :state, :entry_station
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1.5

  def initialize(balance = 0, in_journey=false)
    @balance = balance
  end

  def top_up(amount)
      raise "Maximum Oystercard Balance of £90 Exceeded" if balance + amount > MAXIMUM_BALANCE
      @balance += amount
  end

  def in_journey?
     !!entry_station
  end

  def touch_in(station)
      raise "Can't travel- need £1" if @balance <= MINIMUM_BALANCE
      @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  private
  def deduct(amount)
    amount = MINIMUM_CHARGE
     @balance -= MINIMUM_CHARGE
  end

end
