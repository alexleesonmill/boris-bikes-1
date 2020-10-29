require_relative '../lib/bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise 'No bikes available' unless @bike

    Bike.new
  end

  def dock(bike)
    raise 'Dock Full' if @bike

    @bike = bike
  end
end
