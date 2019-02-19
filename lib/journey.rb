require_relative 'oystercard'
require_relative 'station'

class Journey
  attr_reader :entry_station, :exit_station
# move in journey?, touch_in, touch_out
PENALTY = 6

def initialize(entry_station=nil)
  @entry_station = entry_station
  @exit_station = nil
  @fare = PENALTY
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

def in_journey?
     !!entry_station
end

def fare(entry_station, exit_station)
  if complete? == true
    @fare = Oystercard::MINIMUM_CHARGE + (exit_station.zone - entry_station.zone)
  else

    @fare = PENALTY

  end
end

end
