# Study guide

## **What is OOP?**

---

A programming paradigm that was created to handle the complexity of large software systems. OOP creates containers for data that can be modified without affecting the entire codebase. 

## **What are the benefits of OOP?**

---

1. It makes codebases much easier to maintain and extend.
2. Code can be re-used through inheritance.
3. Objects can model 'real-world' objects, so the complexity of codebases is reduced.
4. Makes the program structure clearer.
5. Can protect the codebase from unwanted changes through encapsulation.

## Classes and Objects

---

Classes define the attributes and behaviours of its objects. Class names are written in CamelCase convention but the filename should be snake_case.  

 

> States track attributes for individual objects (instance variables)

> Behaviours are what objects are capable of doing (instance methods)

### Instantiating objects

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new('Sparky')
```

We have instantiated an object called `sparky` from the class `GoodDog` by invoking the `Class#new` method.

The string `"Sparky"` is passed from the `new` method through to the `initialize` method where is assigned to the parameter `name` . Within the constructor, the instance variable `@name` is initialized and assigned the value referenced by the `name` parameter, which in this case is the string `"Sparky"` .

## Method lookup

---

To view the method lookup path we can invoke the `ancestors` method:

```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
```

```ruby
HumanBeing
Speak
Object
Kernel
BasicObject
```

## Encapsulation

---

### Definition

Encapsulation refers to the process of hiding aspects of functionality and making them unavailable to the rest of the codebase. This is a form of data protection because data can't be modified without obvious intent.

Encapsulation is also a form of abstraction because it involves containing all the data and functionality for part of a program within a single construct and exposing an interface for that construct. The exposed interface is known as the 'public interface'. This refers to all the states and methods that available for direct access outside of the class. The public interface occurs through `public` methods. Functionality is hidden by implementing `private` and `protected` methods.

### Code example

```ruby
 class Dog
  def initialize(name)
    @name = name
  end

  def change_name(new_name)
    self.name = new_name
  end

  private

  attr_writer :name
end

dog = Dog.new('Poppy')
dog.change_name('Skip')
```

In this example the `attr_writer` method for `@name`, which provides access to the setter method is a `private` method and so cannot be accessed directly. The value of `@name` can only be re-assigned by invoking the public method `change_name`. 

## Polymorphism

---

### Definition

Polymorphism is the ability for different types of data to respond to a common interface. This provides flexibility, by enabling pre-written code to be utilised for new purposes. 

Polymorphism can be achieved through:

1. Inheritance
2. Duck-typing
3. Mixing in modules

## Inheritance

---

Inheritance can be implemented in two primary manners: class inheritance and interface inheritance. 

Class inheritance = one class inherits the behaviours of another class

Interface inheritance = class inherits the interface provided by the mixin module

### Using class inheritance vs mixins

If there is an "is-a" relationship = class inheritance i.e. a `Dog` 'is a' `Animal`

If there is a "has-a" relationship = interface inheritance i.e. a `Dog` has an ability to `swim`

## Modules

---

Common naming convention is using '-able' suffix on whatever verb describes the behaviour that the module is modeling i.e. swimmable.

 

## `attr_*` methods

---

`attr_*` methods are public instance methods from the `Module` class. Every instance of a class in Ruby is an instance of the `Class` class. `Class` is a subclass of `Module` , which is a subclass of `Object` . Therefore when you create a new class, you are creating an instance of `Class` which inherits instance methods from `Module` .

![Study%20guide%206618ea45059443328ae6b22c7773db2f/Untitled.png](Study%20guide%206618ea45059443328ae6b22c7773db2f/Untitled.png)

`attr_*` methods take symbols as arguments, which they use to create the getter and setter method names. 

> `attr_accessor` method provides access to getter and setter methods.

> `attr_writer` method provides access to setter methods but not getter.

> `attr_reader` method provides access to getter methods but not setter.

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
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```

`attr_accessor` method creates getter and setter methods for the instance variables `@name`, `@height` and `@weight` . The `GoodDog#speak` and `GoodDog#info` methods both invoke getter methods to retrieve the String objects referenced by the various instance variables. The `GoodDog#change_info` method invokes the setter methods to re-assign the object referenced by each instance variable. `self` is used within `change_info` to disambiguate calling the `name=()` setter method from creating a new `name` local variable. 

### Getter and setter methods

`attr_*` methods provide access to the getter and setter methods for an instance variable. You can explicitly create getter and setter methods, like this:

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def name # getter
    @name
  end

  def name=(name) # setter
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

Invoking the setter method for `name` would require this syntax, `sparky.name=("Poppy")` which feels clumsy. Ruby's syntactical sugar enables us to call the `name` setter method using `sparky.name = "Poppy"` 

Best practice to use getter and setter methods to retrieve/ modify instance variables rather than modifying instance variables directly, especially from outside of the class. For example, you might want to only expose some of the information stored in an instance variable to the public interface i.e:

```ruby
class PersonalDetails
  def initialize(ssn)
    @ssn = ssn
  end

  def ssn
    # converts '123-45-6789' to 'xxx-xx-6789'
    'xxx-xx-' + @ssn.split('-').last
  end
end

jo = PersonalDetails.new('123-45-6789')
jo.ssn
```

Instead of using `attr_reader` method to access to getter method for `ssn` we have explicitly created a `ssn` getter method. This `ssn` method prevents the `@ssn` instance variable being exposed to the public interface.  

## `super` method

`super` is a method that enables us to call methods earlier in the method lookup path. When `super` is invoked from within a method, Ruby will search the method lookup path for a method with the same name, then invoke it.

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  attr_reader :colour

  def initialize(name, colour)
    super(name)
    @colour = colour
  end

  def info
    puts "My name is #{name} and I am a #{colour} #{self.class}!"
  end
end

best_dog = Dog.new("Poppy", "white")
best_dog.info
# => My name is Poppy and I am a white Dog!
```

Within `Dog#initialize` method we have invoked the `super` method and passed in the argument `name` . `super` looks up the method lookup path for another method with the same name (i.e. `initialize`), which it finds in the `Animal` class. `super` transfers the `name` argument to the `Animal#initialize` method and assigns it to the `Animal#initialize` method parameter `name` . The `Dog#initialize` method parameter `name` referenced the String `'Poppy'` therefore when the `Animal#initialize` method is invoked by `super` an instance variable `@name` will be initialized and will be assigned the String object `"Poppy"`. 

### Importance of specifying `super` arguments

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  attr_reader :colour

  def initialize(colour)
    super
    @colour = colour
  end

  def info
    puts "My name is #{name} and I am a #{colour} #{self.class}!"
  end
end

best_dog = Dog.new("white")
best_dog.info
# => My name is white and I am a white Dog!
```

In this example no arguments have been passed into the `super` method but because the `Animal#initialize` method requires an argument, `super` passes the argument that was passed into the  `Dog#initialize` method, which was the String `"White"` . Therefore, both instance variables `@name` and `@colour` reference the string `"white"` .

### Invoking `super` without arguments

If you wish to use `super` to invoke a method higher up the method lookup chain but don't want `super` to pass any arguments to the method up the chain, you have to invoke `super` with parenthesis `super()` to prevent arguments automatically being passed along. 

```ruby
class Animal
  attr_reader :status

  def initialize
    @status = 'good'
  end
end

class Dog < Animal
  attr_reader :name

  def initialize(name)
    super
    @name = name
  end

  def info
    puts "My name is #{name} and I am a #{status} #{self.class}!"
  end
end

poppy = Dog.new("Poppy")
poppy.info 
# => My name is Poppy and I am a good Dog!"
```

If you invoke `super` rather than `super()` the `name` parameter is passed to `Animal#initialize` and you will invoke an `ArguementError (wrong number of arguments (given 1, expected 0))`

## Private, protected and public methods

---

Ruby methods can vary in visibility. Public methods are available in any context, while private methods’ availability is restricted within the instance of a class and its descendants. Private methods can only be accessed by instance methods in the same class. A third visibility scope, protected, behaves similarly to private methods, but protected methods can be called by other instances of the same class.

### Private methods

```ruby
class Dog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def info
    puts "My name is #{name} and I am #{self.human_years} in human years!"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

poppy = Dog.new("Poppy", 10)
poppy.info
```

The `Dog#human_years` method cannot be accessed outside of the class so calling `poppy.human_years` would invoke a `private method` error but `human_years` can be invoked from a `Dog` class instance method. In this example we invoke `Dog#human_years` method from within the `Dog#info` instance method.

As of Ruby 2.7 it is legal to call private methods with literal `self` as the caller.

```ruby
# reset of Dog class code omitted

# Legal >Ruby 2.7
  def info
    puts "My name is #{name} and I am #{self.human_years} in human years!"
  end

  private

  def human_years
    age * DOG_YEARS
  end

# Legal pre-Ruby 2.7
  def info
    puts "My name is #{name} and I am #{human_years} in human years!"
  end

  private

  def human_years
    age * DOG_YEARS
  end

```

### Protected methods

- from inside the class, `protected` methods are accessible just like `public` methods.
- from outside the class, `protected` methods act just like `private` methods.

```ruby
 class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
fido.a_public_method
```

Protected methods aren't commonly used.