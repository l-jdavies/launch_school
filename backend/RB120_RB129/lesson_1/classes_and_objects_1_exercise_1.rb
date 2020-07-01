# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
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

  def display_info
    "My car is a #{year}, #{color} #{model}"
  end
end

new_car = MyCar.new('2020', 'black', 'Tesla')
new_car.display.info
new_car.speed_up(100)
new_car.brake(20)
puts new_car.current_speed
