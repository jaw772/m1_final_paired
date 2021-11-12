require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  let!(:vehicle){Vehicle.new("2001", "Honda", "Civic")}
  let!(:charlie){Passenger.new({"name" => "Charlie", "age" => 18})}
  let!(:taylor){Passenger.new({"name" => "Taylor", "age" => 12})}
  let!(:jude){Passenger.new({"name" => "Jude", "age" => 20})}

  describe '#initialize' do
    it "exists" do
      expect(vehicle).to be_a Vehicle
    end

    it "has attributes" do
      expect(vehicle.year).to eq "2001"
      expect(vehicle.make).to eq "Honda"
      expect(vehicle.model).to eq "Civic"
    end
  end

  describe '#speeding?' do
    it "checks to see if vehicle is speeding" do
      expect(vehicle.speeding?).to be false
    end
  end

  describe '#speed' do
    it "makes the vehicle speed" do
      expect(vehicle.speeding?).to be false
      vehicle.speed
      expect(vehicle.speeding?).to be true
    end
  end

  describe '::passengers' do
    it "gives an array of all passengers in vehicle" do
      expect(vehicle.passengers).to eq []
    end
  end

  describe '#add_passenger' do
    it "adds passengers to the vehicle" do
      expect(vehicle.passengers).to eq []
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to eq [charlie, jude, taylor]
    end
  end

  describe '#num_adults' do
    it "counts the amount of adults in the vehicle" do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.num_adults).to eq 2
    end
  end

  it "has a driver?" do
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    expect(vehicle.has_driver?).to be false
    charlie.drive
    expect(vehicle.has_driver?).to be true
  end
end
