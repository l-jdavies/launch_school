# Fix the following code so it works properly:

# In the original code the `increment_mileage` method contained `mileage = total`. That code initializes a new local variable called `mileage` rather than re-assigning the instance variable `@mileage`. `mileage = total` was changed to `self.mileage = total` to access the setter methods.
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678
