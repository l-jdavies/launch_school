# Variable scope

## Instance variable scope

Instance variables are scoped at the object level and are used to track individual object states - they do not cross over between objects.

**Because instance variables are scoped at the object level, instance variables are accessible in an object's instance methods, even if the variable is initialized outside of that instance method.**

```ruby
class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name                     # is the @name instance variable accessible here? (yes)
  end
end

bob = Person.new('bob')
bob.get_name
```

If you try to access an instance variable that hasn't been initialized yet, `nil` will be return. In comparison, if you try to access an uninitialized local variable, you get a `NameError`.

```ruby
class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => nil
```

Don't put an instance variable at the class level - that's called a class instance variable and it's different to an instance variable.

## Inheritance and instance variable scope

In addition to inheriting instance methods, subclasses also inherit instance variables.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark! Teddy bark! bark!
```

Instance variables are also mixed in to classes when a module is included in a class.

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  # => nil
```

In this example `teddy.swim` returned `nil` because the `enable_swimming` method wasn't invoked, so `@can_swim` hasn't been initialized. That wouldn't be a problem if the `enable_swimming` method was a constructor method. 

Another way of solving the problem is to just call the method:

```ruby
teddy = Dog.new
teddy.enable_swimming
teddy.swim # => "swimming!"
```

## Class variable scope

Class variables are scoped at the class level and they exhibit two main behaviours:

- all class objects share 1 copy of the class variable (implies objects can access class variables via instance methods)
- **class methods** can access **class variables** regardless of where the variable is initialized

```ruby
class Person
  @@total_people = 0            # initialized at the class level

  def self.total_people
    @@total_people              # accessible from class method
  end

  def initialize
    @@total_people += 1         # mutable from instance method
  end

  def total_people
    @@total_people              # accessible from instance method
  end
end

Person.total_people             # => 0
Person.new
Person.new
Person.total_people             # => 2

bob = Person.new
bob.total_people                # => 3

joe = Person.new
joe.total_people                # => 4

Person.total_people             # => 4
```

Only class variables can share states between objects (ignoring globals), instance variables and local variables can't do this. 

## Inheritance and class variable scope

Class variables are accessible to sub-classes:

```ruby
class Animal
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals                           # => 1
```

Note the `Dog` class doesn't contain contain an instance method to explicitly initialize the `@@total_animals` class variable, the variable is initialized when the `Dog` class is evaluated by Ruby.

This has the potential to cause big problems in our code.

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels # => 2
Vehicle.wheels # => 2 (would expect 4!)
```

Changing the value of the `@@wheels` class variable in the sub-class `Motorcycle` has modified the value of `@@wheels` in the `Vehicle` super-class and even worse, all `Vehicle` sub-classes will be affected by this:

```ruby
class Car < Vehicle
end

Car.wheels # => 2
```

Because of this **class variables should be avoided when working with inheritance!!!** Some Rubyists avoid class variables altogether.

## Constant variable scope

Constants have a lexical scope (i.e. limited to where it's defined in the code).

A constant initialized in a super-class is inherited by the sub-class and can be accessed by both class and instance methods:

```ruby
class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels                                  # => 4

a_car = Car.new
a_car.wheels                                # => 4
```

Things get more complicated if you override an inherited constant in a sub-class:

```ruby
class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2
```

In this example `bullet.wheels` is invoking the `wheels` method defined in the `Car` class. Within the `Car` class, the only `WHEELS` constant that's in scope is `WHEELS = 4` which is why `bullet.wheels` returns `4`. 

There are two ways we could fix this:

```ruby
class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2

	def wheels
		WHEELS
	end
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2
```

We could override the inherited `wheels` method, this way invoking `bullet.wheels` will invoke the `wheels` method in the `Motorcycle` class, which has the `WHEELS = 2` constant in scope. 

Or:

```ruby
class Car
  WHEELS = 4

  def wheels
    self.class::WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2
```

Here, when the `wheels` method is invoked by `bullet.wheels` the `Car` `wheels` method, will first return the class of the `bullet` object, which is the `Motorcycle` class, then the `WHEELS` constant is accessed from that class i.e. `Motorcycle`.

It's important to remember that unlike instance methods or instance variables, constants are not evaluated at runtime, so their lexical scope is really important. In this example:

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires                          # => NameError: uninitialized constant Maintenance::WHEELS
```

The `WHEELS` constant isn't in the scope of the `Maintenance` module. This can be fixed by modifying the `change_tires` method to:

```ruby
def change_tires
	"Changing #{Vehicle::WHEELS} tires"
end

# Or
def changing_tires
	"Changing #{Car::WHEELS} tires"
end
```

We can specify to look in the `Car` class for the `WHEELS` constant because `Car` has inherited the constant from `Vehicle`.