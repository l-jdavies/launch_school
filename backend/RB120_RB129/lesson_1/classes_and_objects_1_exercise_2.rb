# Add an accessor method to your MyCar class to change and view the color of your car
# Then add an accessor method that allows you to view, but not modify, the year of your car.


class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

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
  
  def spray_paint(paint)
    self.color = paint
    "I love the new #{self.color} color!"
  end
end

new_car = MyCar.new('2020', 'black', 'Tesla')
new_car.spray_paint('white')
