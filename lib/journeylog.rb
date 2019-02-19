require_relative 'journey'

class Journeylog
attr_reader :journeys, :journey

def initialize(journey_class = Journey)
  @journey_class = journey_class
  # @journey = journey_class.new(entry_station = nil)
  @journeys = []
end

def start(entry_station)
  @journey = @journey_class.new(entry_station)
  @entry_station = entry_station
#
# @entry_station = @journey.start_journey(entry_station)
end

def finish(exit_station)
  @exit_station = exit_station
end

def hold_journey
  if @entry_station !=nil && @exit_station !=nil
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
  else
    @journeys < nil
  end
end

def journeys
  @journeys.dup
end

private
def current_journey
  if @journey.complete?
    @journey = journey_class.new
  else
    @journey
  end
end

end
