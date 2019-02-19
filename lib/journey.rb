require_relative 'oystercard'

class Journey
  attr_reader :entry_station, :exit_station
# move in journey?, touch_in, touch_out
PENALTY = 1

def initialize(entry_station = nil)
  @entry_station = entry_station
  @exit_station = nil
  #initialize with entry
  #receives messages from oystercard class
  #fare - return correct fare
end

def start_journey(station)
  @entry_station = station
end

def end_journey(station)
  @exit_station = station
end

def complete?
  if @exit_station != nil && @entry_station !=nil
    true
  elsif @exit_station == nil ||@entry_station ==nil
    false
  end
end

def fare
  if complete? == true
    @fare = Oystercard::MINIMUM_CHARGE
  else
    @fare = PENALTY
  end
end

end
