## Polymorphism

Polymorphism refers to the ability of different objects to respond in different ways to the same message e.g. method invocation.

There are several ways to implement polymorphism, such as through inheritance or duck-typing.

### Polymorphism through inheritance
```ruby
class Animal
  def eat
    # generic eat method
  end
end

class Fish < Animal
  def eat
    # eating specific to fish
  end
end

class Cat < Animal
  def eat
     # eat implementation for cat
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end
```

In the example above all the objects in the array are different objects and are objects from different classes but because the objects have all been instantiated from classes that have inherited the `Animal` class, the client code can treat the objects as generic objects that have the `eat` behaviour. 

All of the objects can be treated in the same way i.e. as an argument to the `feed_animal` method but the implementations i.e. the action executed by the animal 'eating', will be different. This is what is meant by polymorphism.

### Polymorphism through duck typing
Duck typing is when Ruby doesn't concern itself with the class of an object - only what behaviours are available to an object. 

*If an object 'quacks' like a duck, we treat it like a duck.*

Example of polymorphism with duck typing:
```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end
```
`prepare_wedding` method is defined in each class and within each class the method is implemented in a different way. If another preparer needs to be added to the wedding, a new class can be defined without having to refactor any of the existing code.

## Encapsulation
Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that an object user needs. Those properties and methods are exposed via the public interface of a class: public methods.

```ruby
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!
```

In this example the `dog` nickname can be changed by invoking the `change_nickname` method without the user needing to know anything about the `Dog` class.

**A class should have as few public methods as possible. It simplifies using the class and protects the class data from undesired changes from the outside world.**

