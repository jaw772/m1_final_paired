class Passenger
  attr_reader :name, :age, :interest

  def initialize(info_hash)
    @name = info_hash["name"]
    @age = info_hash["age"]
    @interest = info_hash["interest"]
    @driver = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @driver
  end

  def drive
    if adult? == true
      @driver = true
    end
  end
end
