require 'classes'

describe DockingStation do
  docking_station = DockingStation.new
  bike = docking_station.release_bike

  describe "bike released" do
    it { expect(docking_station.bikes_docked.length).to eq 0 }
  end

  describe "bike docked" do
    before do
      docking_station.dock(bike)
    end
    it { expect(docking_station.bikes_docked.length).to eq 1 }
    it { expect(docking_station.bikes_docked[0]).to be_an_instance_of Bike }
  end

  # it "doesn't give out bikes that don't exist" do
  #   if docking_station.bikes_docked.length == 0
  #     expect(docking_station.release_bike) #throws error
  #   end
  # end
end
