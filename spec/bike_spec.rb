require "Bike"

describe Bike do
  it "can remember if it's broken" do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq false
  end
end
