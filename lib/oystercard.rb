
class Oystercard
attr_reader :balance, :state
MAXIMUM_BALANCE = 90

  def initialize(balance = 0, state=false)
    @balance = balance
    @state = state
  end

  def top_up(amount)
      raise "Maximum Oystercard Balance Exceeded" if @balance + amount > MAXIMUM_BALANCE
      @balance += amount
  end

  def deduct(amount)
     @balance -= amount
  end

  def in_journey?
    @state
  end

  def touch_in
    @state = true
  end

  def touch_out
    @state = false
  end

end
