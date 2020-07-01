# Classes and Objects Part 1

## States and behaviours
When defining a class we focus on two things: states and behaviours.

**States** track attributes for individual objects.

**Behaviours** are what objects are capable of doing.

```ruby
sparky = GoodDog.new
fido = GoodDog.new
```
Here we have two `GoodDog` objects, but each may contain different information e.g. name, weight, height etc.
We would use **instance variables** to track this information. Instance variables are scoped at the object (instance) level and are how objects keep track of their states.

Even though `sparky` and `fido` are different objects, they are both `GoodDog` class objects and therefore contain identical behaviours. The behaviours are defined as **instance methods** in a class. Instance methods are available to objects of that class.

## Initializing a new object
```ruby
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new # => "This object was initialized!"
```
With this code, the `initialize` method gets called everything we instantiate a new `GoodDog` class object. This means calling the `new` class method eventually leads to the execution of the instance method `initialize`. 

The `initalize` method is referred to as a **constructor** because it is executed whenever a new object is created.

## Instance variables
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end
```
`@name` is an instance variable. It is a variable that exists as long as the object exists and is one of the ways data is tied to objects. It doesn't "die" after the `initialize` method as finished executing, it can be referenced until the object is destroyed.

The `initialize` method takes the parameter `name`. Arguments can be passed into the `initialize` method through the `new` method i.e.
```ruby
sparky = GoodDog.new("Sparky")
```

The string "Sparky" is being passed from the `new` method through to the `initialize` method, where it is assigned to the local variable `name`. Within the constructor we set the instance variable `@name` to `name`, which results in assigning the string "Sparky" to the `@name` instance variable. 

This demonstrates that instance variables are responsible for keeping track of information about the state of an object.

## Instance methods
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Woof"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak #=> Woof
```

Instance methods have access to the instance variables, so we could use string interpolation and access `@name` without passing it into the `speak` method as an argument.

```ruby
def speak
  "#{@name} says woof"
end

sparky.speak # => Sparky says woof
```

## Accessor methods
If you want to access instance variables, such as `@name`, then we need to create a method to return that object.
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def speak
    "Woof"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak #=> Woof
puts sparky.get_name #=> "Sparky"
```
`get_name` returns `@name` and is what's called a **getter** method.

If we want to change `@name` then we need a **setter** method:
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end
  
  def set_name=(name)
    @name = name
  end

  def speak
    "Woof"
  end
end

sparky = GoodDog.new("Sparky")
sparky.set_name = "Fido"
puts sparky.get_name #=> Fido
```
Note the different syntax. You would expect to call the `set_name=` method with `sparky.set_name=("Fido")` but because Ruby recognises `set_name=` as a setter method, we can use a more natural assignment syntax `sparky.set_name = "Fido"`. This is an example of syntactical sugar.

As convention, Rubyists name the getter and setter methods using the same name as the instance variable they are exposing and setting i.e:
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def name # renamed from get_name
    @name
  end
  
  def name=(n) # renamed from set_name
    @name = n
  end

  def speak
    "Woof"
  end
end

sparky = GoodDog.new("Sparky")
sparky.set_name = "Fido"
puts sparky.get_name #=> Fido
```

Because these getter and setter methods are so commonplace, and because if you have several instance variables, the code for handling these basic tasks would get really long, Ruby has a way of handling getter and setter methods, using the `attr_accessor` method. Using this method the above code can be refractored:
```ruby
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

 def speak
    "Woof"
  end
end

sparky = GoodDog.new("Sparky")
sparky.set_name = "Fido"
puts sparky.get_name #=> Fido
```
The `attr_accessor` method takes symbols as an argument, which it uses to create the `getter` and `setter` methods.
```ruby
attr_accessor :name, :height, :weight
```

If you only want the getter methods without setter, you can use the `attr_reader` method.

If you only want the setter methods without the getter you can use the `attr_writer` method.

## Accessor methods in action
The getter and setter methods enable us to expose and change an object's state. We can also call these methods from other methods within the class.

Previously, the `speak` method referenced the `@name` instance variable:
```ruby
def speak
  "#{@name} says woof"
end
```

Instead of referencing the instance variable directly, we can call the `name` getter method, provided by `attr_accessor`:
```ruby
def speak
  "#{name} says woof"
end
```

By removing the `@` symbol, we are now calling the instance method rather than the instance variable.

Technically, we could call the instance variable but generally calling the instance method is better practise.

Suppose we're keeping track of social security numbers in an instance variable called `@ssn`. And suppose that we don't want to expose the raw data, i.e. the entire social security number, in our application. Whenever we retrieve it, we want to only display the last 4 digits and mask the rest, like this: "xxx-xx-1234". If we were referencing the @ssn instance variable directly, we'd need to sprinkle our entire class with code like this:
```ruby
# converts '123-45-6789' to 'xxx-xx-6789'
'xxx-xx-' + @ssn.split('-').last
```

And what if we find a bug in this code, or if someone says we need to change the format to something else? It's much easier to just reference a getter method, and make the change in one place.
```ruby
def ssn
  # converts '123-45-6789' to 'xxx-xx-6789'
  'xxx-xx-' + @ssn.split('-').last
end
```
Now we can use the ssn instance method (note without the @) throughout our class to retrieve the social security number. Following this practice will save you some headache down the line.

Just like the getter method, we also want to do the same with the setter method. Wherever we're changing the instance variable directly in our class, we should instead use the setter method. However, there is a potential pitfall.

```ruby
attr_accessor :name, :height, :weight
```

This one line of code gives us six getter/setter instance methods: `name`, `name=`, `height`, `height=`, `weight`, `weight=`. It also gives us three instance variables: `@name`, `@height`, `@weight`. Now suppose we want to create a new method that allows us to change several states at once, called `change_info(n, h, w)`. The three arguments to the method correspond to the new name, height, and weight, respectively. We could implement it like this:
```ruby
def change_info(n, h, w)
  @name = n
  @height = h
  @weight = w
end
```

This is what the `GoodDog` codebase will look like, with the addition of an `info` method that displays all the object's states.
```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```

The `change_info` method can be implemented like this:
```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```

The code above works but one thing to be cautious of is accidentally writing the `change_info`method like this:
```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```
because in this example, we have initalised local variables `name`, `height` etc. rather than changed the instance variables using the `name=` etc methods. This can be avoided by using `self`.

## Calling methods with self
To prevent any ambiguity between initialising local variable `name` and calling `name=` method we can use `self.name=`. We can refactor the `change_info` method:
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

This syntax could also be used for the getter methods but it's not required.
```ruby
def info
  "#{self.name} weighs #{self.weight} and is #{self.height} tall."
end
```

## Exercises
1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

```ruby
class MyCar
  attr_accessor :year, :colour, :model, :speed

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
```

2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

```ruby
class MyCar
  attr_accessor :colour, :model, :speed
  attr_reader :year

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
```

3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

```ruby
def spray_paint(new_colour)
  self.colour = new_colour
  puts "I love the new #{@color} paint"
end

new_car.spray_paint("blue")
```
