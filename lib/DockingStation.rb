DockingStation = Class.new

class DockingStation
  attr_accessor :bikes, :capacity

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes to take out." if no_working_bikes?
    bike_to_release = working_bikes.last
    @bikes.delete(bike_to_release)
    bike_to_release
  end

  def dock(bike)
    raise "Docking station full." if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def no_working_bikes?
    working_bikes.empty?
  end

  def working_bikes
    @bikes.select { |bike| bike.working? }
  end
end
