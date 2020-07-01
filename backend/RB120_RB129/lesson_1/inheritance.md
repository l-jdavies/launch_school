# Inheritance

## Class inheritance
In this example we are extracting `speak` method into a superclass `Animal` and using inheritance to make the behaviour available to `GoodDog` and `Cat` classes.

```ruby
class Animal
  def speak
    "Hello"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new

puts sparky.speak #=> "Hello"
puts paw.speak #=> "Hello"
```
The `<` symbol causes the subclass to inherit from the `Animal` superclass.

If there's an instance method with the same name as an instance method in a superclass, the class method will be executed because Ruby check's the object's class for the method before checking the superclass.

Inheritance is good to remove duplication in a codebase. Remember DRY: Don't Repeat Yourself.

## `super`

The built-in function `super` enables us to call methods up the inheritance hierarchy.
```ruby
class Animal
  def speak
    "Hello"
  end
end

class GoodDog < Animal
  def speak
    super + "from the GoodDog class"
  end
end

sparky = GoodDog.new
puts sparky.speak #=> "Hello from the GoodDog class"
```

A common way of using `super` is with `initialize`

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDod < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown") # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```
Note that `super` automatically forwarded the arguments that were passed into the method `super` was called from. `super` passed the `color` argument from the `initialize` method in `GoodDog` (the subclass) to the `initialize` method in the `Animal` superclass and invoked it. That resulted in the invocation of `@name = "brown"`.

If `super` is called with arguments, then the specified arguments are passed up the method lookup chain.
```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDod < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end
end

bruno = GoodDog.new("Bruno", "brown") # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="Bruno">
```

## Mixing in modules
Extracting methods to a superclass is great if subclasses are naturally hierachical however, sometimes that isn't the case, in which instance you can use modules.
```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
```

A common convention for Ruby is to use the suffix "-able" on whatever verb descibes the behaviour that the module is modelling.

## Inheritance vs modules
Class inheritance is the traditional way to think about inheritance - one class inherits behaviours from another class. Another form of inheritance is **interface inheritance**, which occurs through mixin modules. The class doesn't inherit from another type but instead inherits the interface provided by the mixin module.

Things to consider when deciding whether to use class inheritance or mixins:
* You can only subclass from one class but you can mixin as many modules as you like.
* If there is an "is-a" relationship, then class inheritance is usually the correct choice. If there a "has-a" relationship, interface inheritance is probably better. For example, a dog "is-an" animal and it "has-a" ability to swim.
* You can't instantiate a module i.e. objects can't be created from modules. Modules are only used for name-spacing methods and grouping common methods together.

## More modules
Another use for modules is **name-spacing**. This refers to organizing similar classes under a module i.e. using modules to group related classes. The first advantage is that it makes it easier to recongize related classes in the code base. The second is that it reduces the likelihood of classes colliding with similarly named classes in the codebase.

```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```
Classes in modules are called by appending the class name to the module with two colons `::`
```ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
budy.speak("woof")
kitty.say_name("Kitty")
```

Modules can also be used as a **container** for emthods, called module methods. It's useful for methods that seem out of place in a code base.

```ruby
module Mammal

  def self.some_out_of_place_method(num)
    num ** 2
  end
end
```
Methods defined this way can be called directly from the module:
```ruby
value = Mammal.some_out_of_place_method(4)
```
You can also do this:
```ruby
value = Mammal::some_out_of_place_method(4)
```
But the first option is preferred.

## Private, Protected and Public

By default, methods within a class are public. Public methods are available for the rest of the program to use and comprise the class's interface i.e. how other classes and objects will interact with this class and its objects.

If you don't want a method to be available outside of a class, methods can be made private by calling the `private` method. Any methods below `private` will be private.
```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
```
 Now you can't call `sparky.human_years` because you're trying to call the `human_years` method outside of the class.

To access the return value of `human_years`, we need a method within the same class as the private method:
```ruby
def public_disclosure
  "#{self.name} in human years is #{human_years}"
end
```
Note the use of `#{human_years}` not `self.human_years` because that would be the same as `sparky.human_years`.

## Exercises
1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

```ruby
class Vehicle
  def self.gas_mileage(liters, miles)
    puts "#{liters/miles} miles per liter of petrol"
  end
end

class MyCar < Vehicle
  AIRBAGS = "Yes"
end

class MyTruck < Vehicle
  AIRBAGS = "No"
end
```

2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

```ruby
class Vehicle
  @@number_of_cars = 0

  def initialize
    @@number_of_cars += 1
  end

  def self.number_of_cars
    puts "The number of cars on the road is #{number_of_cars}"
  end

  def self.gas_mileage(liters, miles)
    puts "#{liters/miles} miles per liter of petrol"
  end
end

class MyCar < Vehicle
  AIRBAGS = "Yes"
end

class MyTruck < Vehicle
  AIRBAGS = "No"
end
```

3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

```ruby
module BrokenLight
  def has_broken_light?
    True
  end
end

class Vehicle
  @@number_of_cars = 0

  def initialize
    @@number_of_cars += 1
  end

  def self.number_of_cars
    puts "The number of cars on the road is #{number_of_cars}"
  end

  def self.gas_mileage(liters, miles)
    puts "#{liters/miles} miles per liter of petrol"
  end
end

class MyCar < Vehicle
  AIRBAGS = "Yes"
end

class MyTruck < Vehicle
  include BrokenLight
  AIRBAGS = "No"
end
```

4. Print to the screen your method lookup for the classes that you have created.
```ruby
puts Vehicle.ancestors
puts MyCar.ancestors
puts MyTruck.ancestors
```


