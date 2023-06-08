class Vehicle
end

class Car < Vehicle
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    name == other.name
  end
end