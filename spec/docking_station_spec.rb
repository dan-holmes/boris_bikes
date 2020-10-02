require "classes"

describe DockingStation do
  let(:bike) { double(:bike, :working? => true) }
  it "can dock and release a bike" do
    docking_station = DockingStation.new
    docking_station.dock(bike)
    expect(docking_station.release_bike).to eq bike
  end

  it "can dock and release multiple bikes" do
    docking_station = DockingStation.new
    test_bikes = []
    docking_station.capacity.times { test_bikes.push(bike.clone) }
    test_bikes.each { |bike| docking_station.dock(bike) }
    released_bikes = []
    docking_station.capacity.times { released_bikes.push(docking_station.release_bike) }
    expect(test_bikes).to eq released_bikes.reverse
  end

  it "will not dock a bike if full" do
    docking_station = DockingStation.new
    docking_station.capacity.times { docking_station.dock(double(:bike)) }
    expect { docking_station.dock(double(:bike)) }.to raise_error("Docking station full.")
  end

  it "will not release a bike if empty" do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error "There are no bikes to take out."
  end

  it "can take a custom capacity and not all any more bikes to be docked" do
    docking_station = DockingStation.new(15)
    15.times { docking_station.dock(double(:bike)) }
    expect { docking_station.dock(double(:bike)) }.to raise_error "Docking station full."
  end

  it "has a default capacity of 20 if no capacity given" do
    docking_station = DockingStation.new
    20.times { docking_station.dock(double(:bike)) }
    expect { docking_station.dock(double(:bike)) }.to raise_error "Docking station full."
  end

  it "will not release a broken bike" do
    docking_station = DockingStation.new
    allow(bike).to receive(:working?).and_return(false)
    docking_station.dock(bike)
    expect { docking_station.release_bike }.to raise_error "There are no bikes to take out."
  end

  it "can dock all bikes but will only release working ones" do
    docking_station = DockingStation.new(10)
    test_bikes = []
    10.times { test_bikes.push(bike.clone) } # Make a load of test bikes
    test_bikes.each_with_index { |bike, index| allow(bike).to receive(:working?).and_return(false) if index.even? } # Report half of them as broken
    test_bikes.each { |bike| docking_station.dock(bike) } # Dock them all
    released_bikes = []
    5.times { released_bikes.push(docking_station.release_bike) } # Release 5 bikes
    released_bikes.each { |bike| expect(bike.working?).to eq true } # They should all be working
  end
end
