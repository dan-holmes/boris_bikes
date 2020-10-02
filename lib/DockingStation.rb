DockingStation = Class.new

class DockingStation
  attr_accessor :bikes, :capacity

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes to take out." if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station full." if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
