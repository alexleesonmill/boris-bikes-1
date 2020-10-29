require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?

    @bikes.pop
  end

  def dock(bike)
    raise 'Dock Full' if full?

    @bikes << bike
  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end
end
