require_relative 'journey'

class Journeylog
attr_reader :journeys

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

def current_journey
  if @journey.complete?
end

end
