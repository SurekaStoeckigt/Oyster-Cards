
class Oystercard
attr_reader :balance, :state, :entry_station, :exit_station, :journeys
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1.5

  def initialize(balance = 0, in_journey=false)
    @balance = balance
    @journeys = []
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

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @journeys << {entry_station: @entry_station, exit_station: station}
    @entry_station = nil
    @exit_station = station
  end

  private
  def deduct(amount)
    amount = MINIMUM_CHARGE
     @balance -= MINIMUM_CHARGE
  end

end
