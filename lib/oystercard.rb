
class Oystercard
attr_reader :balance
MAXIMUM_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
      raise "Maximum Oystercard Balance Exceeded" if @balance + amount > MAXIMUM_BALANCE
      @balance += amount
  end

end
