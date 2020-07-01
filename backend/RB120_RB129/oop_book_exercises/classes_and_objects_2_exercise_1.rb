# Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  @@gas_mileage = 0

  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@gas_mileage += 10
  end

  def self.total_gas_mileage
    @@gas_mileage
  end

  def speed_up(num)
    self.speed += num
  end

  def brake(num)
    self.speed -= num
  end

  def switch_off
    self.speed = 0
  end

  def current_speed
    "#{self.speed} mph"
  end
  
  def spray_paint(paint)
    self.color = paint
    "I love the new #{self.color} color!"
  end
end

new_car = MyCar.new('2020', 'black', 'Tesla')
new_car.spray_paint('white')

puts MyCar.total_gas_mileage
