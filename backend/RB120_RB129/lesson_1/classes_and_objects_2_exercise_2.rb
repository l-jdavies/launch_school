# Override the to_s method to create a user friendly print out of your object.

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

  def to_s
    "My car is a #{year}, #{color} #{model} with a gas mileage of #{@@gas_mileage}"
  end
end

new_car = MyCar.new('2020', 'black', 'Tesla')
new_car.spray_paint('white')

puts MyCar.total_gas_mileage
puts new_car
