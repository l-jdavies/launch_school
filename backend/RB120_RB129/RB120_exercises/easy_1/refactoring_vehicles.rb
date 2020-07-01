# Consider the following classes:
# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model, :number_of_wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @number_of_wheels = wheels
  end

  def to_s
    "#{make} #{model}"
  end

end


class Car < Vehicle
end

class Motorcycle < Vehicle
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, wheels, payload)
    super (make, model, wheels)
    @payload = payload
  end
end
