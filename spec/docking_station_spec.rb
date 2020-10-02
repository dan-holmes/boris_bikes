require "classes"

describe DockingStation do
  it "can dock and release a bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.release_bike).to eq bike
  end

  it "will not dock a bike if full" do
    docking_station = DockingStation.new
    docking_station.capacity.times { docking_station.dock(Bike.new) }
    expect { docking_station.dock(Bike.new) }.to raise_error("Docking station full.")
  end

  it "will not release a bike if empty" do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error "There are no bikes to take out."
  end

  # describe "docking station full" do
  #   before do
  #     docking_station.bikes_docked = []
  #     docking_station.default_capacity.times { docking_station.dock(Bike.new) }
  #   end
  #   it { expect { docking_station.dock(bike) }.to raise_error("Docking station full.") }
  # end

  # describe "docking station is empty" do
  #   before do
  #     docking_station.bikes_docked = []
  #   end
  #   it { expect { docking_station.release_bike }.to raise_error("There are no bikes to take out.") }
  # end

  # describe "# setting a custom capacity" do
  #   custom_docking_station = DockingStation.new(15)
  #   15.times { custom_docking_station.dock(Bike.new) }
  #   expect { custom_docking_station.dock(Bike.new) }.to raise_error("Docking station is full.")
  # end
end
