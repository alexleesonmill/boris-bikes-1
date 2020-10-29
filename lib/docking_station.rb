require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if @bikes.empty?

    @bikes.pop
  end

  def dock(bike)
    raise 'Dock Full' if @bikes.count >= 20

    @bikes << bike
  end
end
