DockingStation = Class.new

class DockingStation
  attr_accessor :bikes_docked, :capacity

  DEFAULT_CAPACITY = 20

  def default_capacity
    DEFAULT_CAPACITY
  end

  def initialize(capacity = 20)
    @bikes_docked = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes to take out." if empty?
    returned_bike = @bikes_docked[-1]
    @bikes_docked.pop
    return returned_bike
  end

  def dock(bike)
    raise "Docking station full." if full?
    @bikes_docked << bike
  end

  private

  def full?
    @bikes_docked.length >= @capacity
  end

  def empty?
    @bikes_docked.empty?
  end
end
