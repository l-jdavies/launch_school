# The object model

## What is OOP?
OOP is a programming paradign that was created to deal with the complexity of large software systems.
Large, complex applications are difficult to maintain - one small change can have a ripple effect throughout the program due to dependencies.

OOP enables the creation of containers for data so data can be changed and manipulated without affecting the entire program. It enables code to be sectioned, with each section performing a specific process so programs become the interaction of many parts, rather than one massive blob of dependency.

## Terminology
### Encapsulation:
Hiding pieces of functionality and making it unavailable to the rest of the code base. It's a form of data protection - data cannot be changed without obvious intent. It defines the boundaries in an application, enabling code to achieve new levels of complexity. Ruby achieves encapsulation by creating objects and exposing interfaces (i.e. methods) to interact with those methods.

### Polymorphism:
The ability for data to represented as different types.

### Inheritance:
In Ruby this refers to a class inheriting the behaviours of another class. The class behaviours are inherited from are called the **superclass**. The class inheriting the behaviours is called the **subclass**. Inheritance gives Ruby programmers the ability to define basic classes with widely used behaviours and define subclasses for more specific behaviours.

### `Module`:
Modules are another way to apply polymorphic structure to Ruby problems. Modules are similar to classes because they contain shared behaviours. However, you cannot create and object with a module. A module must be added into a class using the `include` method invocation. This is called a `mixin`. After mixing in a module to a class, the behaviours declared in the module are available to the class and its objects.

## "Everything in Ruby is an object.."
This isn't strictly true. You could say anything of **value** is an object, however, there are a few things that aren't objects, such as methods and blocks. 

## Classes define objects
Classes define the attributes and behaviours of an object. They are a basic outline of what an object should be made of and what the object can do. Classes are named using CamelCase convention but the Ruby file name should be named using snake_case.
```ruby
good_dog.rb

class GoodDog
end

sparky = GoodDog.new
```
In the above example we have created an instance of the class `GoodDog` and stored it in the variable `sparky`. 

We can say `sparky` is an object, or instance, of class `GoodDog`. Creating a new object or instance from a class is called **instantiation**, so we can say we have instantiated an object called `sparky` from the class `GoodDog`.

## Modules
A module is a collection of behaviours that can be used in other classes via **mixins**. 

```ruby
module Speak
  def speak(sound)
    puts sounds
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Woof") #=> "Woof"

bob = HumanBeing.new
bob.speak("Hello") #=> "Hello"
```

The module `Speak` has been mixed in to the `GoodDog` and `HumanBeing` classes.

## Method lookup
When a method is called Ruby has a hierarchy for looking up the method. The method lookup chain can be accessed with the `ancestors` method.

```ruby
puts "---GoodDog ancestors---"
puts GoodDog.ancestors

# output
---GoodDog ancestors---
GoodDog
Speak
Object
Kernel
BasicObject
```

## Exercises
1. How do we create an object in Ruby? Give an example of the creation of an object.
```ruby
class ExampleClass
end

test = ExampleClass.new
```

2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

A module can be used to achieve polymorphism. It's a way of including behaviours that maybe utilised by several unrelated classes, in a class.

```ruby
module Useful
  def hello
    puts "Hello, I'm a module"
  end
end

class ExampleClass
  include Useful
end

test = ExampleClass.new
```
