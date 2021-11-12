class Vehicle
  attr_reader :year, :make, :model, :passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @passengers = []
    @fast = false
  end

  def speeding?
    @fast
  end

  def speed
    @fast = true
  end

  def add_passenger(passenger)
    @passengers.push(passenger)
  end

  def num_adults
    adults = []
    @passengers.each do |passenger|
      if passenger.adult? == true
        adults.push(passenger)
      end
    end
    adults.count
  end

  def has_driver?
    has = false
    @passengers.each do |passenger|
      if passenger.driver? == true
        has = true
      end
    end
    has
  end
end
