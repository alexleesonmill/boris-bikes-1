require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes, :capacity, :broken_bikes

  def initialize(x = 20)
    @bikes = []
    @capacity = x
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?

    @bikes.pop
  end

  def dock(bike)
    raise 'Dock Full' if full?

    @bikes << bike
  end

  def broken
    @broken_bikes << @bikes.pop
  end

  private

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
