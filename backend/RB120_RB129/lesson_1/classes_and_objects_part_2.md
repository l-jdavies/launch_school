# Classes and objects part II

## Class methods

Class methods are methods that are called directly on the class itself, without having to instantiate an object

Class method names are prepended with the reserved word `self`.

```ruby
def self.what_am_i
  "I'm a GoodDog class"
end

GoodDog.what_am_i #=> I'm a GoodDog class
```

Class methods are used for functionality that doesn't relate to individual objects. 

## Class variables
Instance variables capture information relating to specific instances of classes (i.e. objects) whereas class variables capture class level detail that pertains only to the class, not to individual objects.

Class variables are intialized with `@@`.

```ruby
class GoodDog

  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs # class method
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs #=> 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs #=> 2
```

## Constants
You can create constants within a class:

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n  # using `self` instead of `@name` to represent instance variables
    self.age = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age #=> 28
```

## More about `self`
`self` can refer to different things depending on where it is used.

So far we've seen two clear cases for `self`:

1. When calling setter methods from within the class. `self` was used to disambiguate between initializing a local variable and calling a setter method.
2. When defining class methods.

## Exercises
1. dd a class method to your MyCar class that calculates the gas mileage of any car.
```ruby
class MyCar
  attr_accessor :colour, :model, :speed
  attr_reader :year

  @@gas_mileage = 0

  def self.miles_traveled(num)
    @@gas_mileage += num
  end

  def initialize(y, c, m)
    @year = y
    @colour = c
    @model = m
    @speed = 0
  end

  def increase_speed(num)
    @speed += num
  end

  def brake(num)
    @speed -= num
  end

  def switch_off
    @speed = 0
  end

  def current_speed
    "You are currently going #{@speed} mph"
  end
end

new_car = MyCar.new("1999", "red", "Ford")
MyCar.miles_traveled(50)
```
2. Override the to_s method to create a user friendly print out of your object.
```ruby
class MyCar
  attr_accessor :colour, :model, :speed
  attr_reader :year

  @@gas_mileage = 0

  def self.miles_traveled(num)
    @@gas_mileage += num
  end

  def initialize(y, c, m)
    @year = y
    @colour = c
    @model = m
    @speed = 0
  end

  def increase_speed(num)
    @speed += num
  end

  def brake(num)
    @speed -= num
  end

  def switch_off
    @speed = 0
  end

  def current_speed
    "You are currently going #{@speed} mph"
  end

  def to_s
    "My car is a #{year}, #{colour} #{model} and it's awesome!"
  end
end

new_car = MyCar.new("1999", "red", "Ford")
puts new_car
```

3. When running the following code...
```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
```

We get the following error:
```ruby
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
```

Why did we get this error and how do we fix it?

It's because the `attr_reader` method has been used, which only provide access to getter methods, not setter. The error could be fixed by using `attr_accessor` or `attr_writer`.
