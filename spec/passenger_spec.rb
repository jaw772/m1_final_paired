require './lib/passenger'

RSpec.describe Passenger do
  let!(:charlie){Passenger.new({"name" => "Charlie", "age" => 18})}
  let!(:taylor){Passenger.new({"name" => "Taylor", "age" => 12})}

  describe '#initialize' do
    it "exists" do
      expect(charlie).to be_a Passenger
      expect(taylor).to be_a Passenger
    end

    it "has attributes" do
      expect(charlie.name).to eq "Charlie"
      expect(charlie.age).to eq 18
    end
  end

  describe  '#adult?' do
    it "checks to see if passenger is an adult" do
      expect(charlie.adult?).to be true
      expect(taylor.adult?).to be false
    end
  end

  describe '#driver?' do
    it "checks to see if a passenger is a driver for the vehicle" do
      expect(charlie.driver?).to be false
    end
  end

  describe '#drive' do
    it "establishes a passenger as a driver" do
      expect(charlie.driver?).to be false
      taylor.drive
      expect(taylor.driver?).to be false
      charlie.drive
      expect(charlie.driver?).to be true

    end
  end
end
