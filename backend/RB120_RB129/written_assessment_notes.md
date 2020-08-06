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

### Object State

Every object is an instantiation of a class. Objects encapsulate state. Instance methods perform functions on the object's state.

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

## Abstraction

---

Abstraction is a process of hiding the implementation details from the user, only the functionality will be provided to the user i.e. the user will have the information on what the object does instead of how it does it.  Methods are an example of abstraction - the process of how an action occurs is hidden from the user, the user just needs to know the outcome of the action. 

Encapsulation = a kind of abstraction that involves containing all the data and functionality for part of your program within a single construct, and exposing an interface for that construct.

Abstraction = hiding the details of **how** something works to focus on **what** it does.

**Benefits:**

1. Abstraction helps to reduce the complexity of the design and implementation process of software. 
2. Enables developers to think on a 'higher level' without getting bogged down in the underlying mechanics of every process.

**How it is achieved:**

The Ruby language itself is an example of abstraction! Classes, methods and modules are all used to achieve abstraction.

- **Example code:**

    ```ruby
    Class Dog
    	attr_reader :name, :age

    	def initialize(name, age)
    		@name = name
    		@age
    	end

    	def info
    		puts "My name is #{name} and I am #{age} years old!"
    	end
    end

    poppy = Dog.new("Poppy", 10)
    poppy.info
    ```

## Encapsulation

---

### Definition

Encapsulation refers to the process of hiding aspects of functionality and making them unavailable to the rest of the codebase. This is a form of data protection because data can't be modified without obvious intent.

Encapsulation is also a form of abstraction because it involves containing all the data and functionality for part of a program within a single construct and exposing an interface for that construct. The exposed interface is known as the 'public interface'. This refers to all the states and methods that available for direct access outside of the class. The public interface occurs through `public` methods. Functionality is hidden by implementing `private` and `protected` methods.

### Code example

```ruby
 class Dog
  attr_reader :name

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
puts dog.name
# => "Poppy"
dog.change_name('Skip')
puts dog.name
# => "Skip"

dog.name = "Bob"
```

In this example the `attr_writer` method for `@name`, which provides access to the setter method is a `private` method and so cannot be accessed directly. The value of `@name` can only be re-assigned by invoking the public method `change_name`. 

## Polymorphism

---

### Definition

Polymorphism is the ability for different types of data to respond to a common interface. This provides flexibility, by enabling pre-written code to be utilised for new purposes. It also produces more maintainable code. For polymorphism to occur we need two or more object types with a method of the same name. That enables the method to be invoked on the objects, regardless of the object type.

Polymorphism can be achieved through:

1. Inheritance
2. Duck-typing
3. Mixing in modules

### Polymorphism through inheritance

```ruby
class Student
  attr_reader :type

  def student_type
    @type = 'student'
  end
end

class Undergraduate < Student
  def student_type
    @type = "undergraduate"
  end
end

class Postgraduate < Student
  def student_type
    @type = "postgraduate"
  end
end

def list_student_type(individual)
  puts "I am a #{individual.student_type}!"
end

study_group = [Student.new, Undergraduate.new, Postgraduate.new]

study_group.each { |person| list_student_type(person) }

# => I am a student!
# => I am a undergraduate!
# => I am a postgraduate!
```

In this example there are three different object types but they have all inherited the `student_type` method. Even though each object type implements the `student_type` differently, the same method can be invoked on the different object types because they have all inherited the `student_type` method.

### Polymorphism through duck-typing

Polymorphism through duck typing is similar to polymorphism through inheritance in that Ruby doesn't concern itself with the class of an object, only the behaviours that are available to the object. However, duck typing differs from inheritance in that the different object types don't all inherit a method with the same name, instead a method with the same name is explicitly created in multiple un-related classes.

```ruby
class Person
  def swim
    puts "I'm swimming front crawl"
  end
end

class Dog
  def swim
    puts "I'm doing a doggy paddle"
  end
end

class Fish
  def swim
    puts "I'm a swimming pro"
  end
end

def gone_swimming(creature)
  creature.swim
end

river_swimmers = [Person.new, Dog.new, Fish.new]

river_swimmers.each { |swimmer| gone_swimming(swimmer) }
# => I'm swimming front crawl
# => I'm doing a doggy paddle
# => I'm a swimming pro
```

  

## Inheritance

---

Inheritance in Ruby extracts common behaviors into a single super-class. Sub-classes inherit from a single super-class. Sub-classes can contain more specialised behaviours. Inheritance removes repetitive code.

Inheritance can be implemented in two primary manners: class inheritance and interface inheritance. 

Class inheritance = one class inherits the behaviours of another class

Interface inheritance = class inherits the interface provided by the mixin module

### Using class inheritance vs mixins

If there is an "is-a" relationship = class inheritance i.e. a `Dog` 'is a' `Animal`

If there is a "has-a" relationship = interface inheritance i.e. a `Dog` has an ability to `swim`

## Modules

---

Common naming convention is using '-able' suffix on whatever verb describes the behaviour that the module is modeling i.e. swimmable.

Three common uses for modules are:

1. Mixin behaviours to multiple classes that don't have a class inheritance relationship
2. Namespacing - organizing similar classes into a module
3. Container for methods - organise methods that seem out of place in the codebase into a module

### Namespacing

Namespacing is process of using modules to group related classes. The advantages are: it makes it easy to recognise related classes in the code and it reduces the likelihood of classes conflicting with other classes of a similar name. 

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

 Access classes within a module by using the namespace resolution operator `::` 

```ruby
poppy = Mammal::Dog.new
ziggy = Mammal::Cat.new
```

### Container for methods

Methods stored in a module are called module methods. Module methods can be useful to organise methods that seem out of place in the code.

```ruby
module WeirdMethods
  def self.annoying_method
    puts "I'm a weird method that doesn't fit anywhere else :("
  end
end

sad_method = WeirdMethods.annoying_method
```

Module methods are called directly from the module.

## Collaborator objects

---

Objects that are stored as state within other objects are called **collaborator objects**. They are called this because they work in *collaboration* with the class they are associated with.

Collaborator objects are usually custom objects i.e. defined by the programmer rather than inherited from the Ruby core library. 

```ruby
class Dog
  def fetch
    puts "I can play fetch!"
  end
end

class Person
  attr_accessor :pet

  def initialize(name)
    @name = name
  end
end

jo = Person.new('Jo')
poppy = Dog.new

jo.pet = poppy
jo.pet.fetch
```

In this example `jo` has a collaborator object `poppy` that is stored within the `@pet` instance variable. `jo` object can access public methods within the `Dog` class by calling the `Dog` method on the `pet` variable i.e. `jo.pet.fetch` 

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

## `super`

`super` is a keyword that enables us to call methods earlier in the method lookup path. When `super` is invoked from within a method, Ruby will search the method lookup path for a method with the same name, then invoke it.

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
 class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end
```

In this example if `attr_reader :amount` was private then `bills_wallet > pennys_wallet` would invoke a `private_method` error because `amount <=> other_wallet.amount` needs to retrieve the `amount` from the other object. This works when `attr_reader :amount` is a `private` method because the class can call `protected` methods of any object of the same class. Therefore the `bills_wallet` object can access the `amount` variable from `pennys_wallet` object.

## `self`

---

The keyword `self` gives access to the current object.

Two primary uses of `self` :

1. When calling setter methods from within a class.
2. When defining class methods

What does `self` refer to in these three scenarios:

1. Inside an instance method?

**The calling object**

2. Inside a setter method?

**The instance variable**

3. Prepended to a method definition?

**The class**

## Equivalence

---

### `BasicObject#==` method

The default behaviour of the `BasicObject#==` method is to determine if two objects are equal, not to test if the **value** of two objects are equal. That is why the `BasicObject#==` method is frequently overridden to implement class specific behaviour that compares the value of two objects. 

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2 
```

`bob == bob2` here we currently calling the `BasicObject#==` method, which will return false because `bob` and `bob2` are two different `Person` class objects. We can override the `==` method:

```ruby
class Person
  attr_accessor :name

  def ==(other)
    name == other.name
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2 
```

Now when we call `bob == bob2` we are invoking the `Person#== method` which returns the `name` from the calling object, `bob` and compares the `"bob"` string with the `name` variable retrieved from the object passed in as an argument, `bob2` . Within the `Person#==` method, the `String#==` method is called to compare the two string objects. Now the code will return `true` .

Note that `45 == 45.0` will return `true` even though an `Integer` is being compared with a `Float` . That is because the `Integer#==` method implementation can handle to the conversion of a `Float` to an `Integer` .

When you define `==` you get `!=` for free.

### `equal?` method

The `BasicObject#equal?` method determines if two variables reference the same object (i.e. the same implementation as `BasicObject#==` . Unlike `BasicObject#==` , this method should not be overridden. 

```ruby
str1 = "something"
str2 = "something"
str1_copy = str1

str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false
```

### `===` method

The `===` instance method is implicitly used by the `case` statement. 

```ruby
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end
```

In this example the `case` statement is invoking the `===` method to compare each `when` clause with `num` . In this example the `when` causes are ranges so the `Range#===` method is invoked, as so `1..50 === num` . This code tests if `1..50` is a group, then does `num` belong to that group.

Another example:

```ruby
String === 'hello'
```

`String#===` will return `true` because `'hello'` is a `String` object, even though `String` and `'hello'` are not the same objects, nor do they have the same value.

```ruby
String === 15
```

This will return `false` because `15` is an `Integer` , not an instance of the `String` class, nor does it have the same value as `String` .

As `===` is usually only used by `case` statements, you would only need to override the default behaviour if you were using custom classes in a `case` statement, which isn't common.

### `eql?` method

`eql?` method determines if two objects contain the same value **and** are instances of the same class. It's most frequently used by `Hash` class to determine equality among it's members. It's not used often and shouldn't be overridden. 

## Variable scope

---

Instance variables = object level

Class variables = class level (one copy shared between all class descendants)

Constants = lexical scope

### Instance variable scope

Instance variables are scoped at the object level therefore, instance variables are accessible in an object's instance methods, even if the instance variable is initialise outside of the instance method. 

If you try to access an instance variable that hasn't been initialised yet, `nil` will be return. This differs from local variables, which returns a `NameError` if you try to reference an uninitialised local variable. 

Sub-classes inherit instance variables from the super-class because the instance methods that initialize the instance variables are inherited.

### Class variable scope

Class variables are scoped at the class level. They exhibit two main behaviours:

1. All class objects share a single copy of a class variable
2. Class methods can access class variables, regardless of where the class variables was initialised.

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

The fact all sub-classes inherit one copy of each class variable can potentially cause big problems. If a class variable is modified in one sub-class, that modification affects all other classes in the inheritance hierarchy.

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

Motorcycle.wheels
# => 2                
Vehicle.wheels
# => 2 (would expect 4)
```

The potential for introducing error is why most Rubyists recommend avoiding class variables, especially when you have class inheritance relationships. 

### Constant scope

Within one class, constants can be accessed in class methods or instance methods.

```ruby
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

Person.titles                   # => "Mr, Mrs, Ms, Dr"

bob = Person.new('bob')
bob.name
```

Constants can be accessed between two unrelated classes, as long as you specify the class in which the constants were initialized, using the namespace resolution operator:

```ruby
class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS
  end
end

kitty = Cat.new
kitty.legs
# => 4
```

Sub-classes inherit constants from super-classes and can access the constants without the namespace resolution operator:

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

Car.wheels
# => 4

a_car = Car.new
a_car.wheels
# => 4
```

Methods within a module can access constants initialized in a class, as long as you specify the class in which the constants were initialized, using the namespace resolution operator. The module can access constants even if the module hasn't been mixed in to the class.

```ruby
 module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tyres."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires
# => 'Changing 4 tyres'
```

### Inheriting instance variables in modules

When a modules is mixed in to a class, that class can access instance variables initialized in the module, providing the instance methods that initialize the instance variables have been invoked. 

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

poppy = Dog.new
poppy.swim
```

`poppy.swim` will return `nil` because the `Swim#enable_swimming` method has not been invoked, therefore the `@can_swim` instance variable has not been initialized. We would need to invoke the following:

```ruby
poppy = Dog.new
poppy.enable_swimming
poppy.swim
# => 'swimming!'
```

## Fake operators

---

![Study%20guide%206618ea45059443328ae6b22c7773db2f/Untitled%201.png](Study%20guide%206618ea45059443328ae6b22c7773db2f/Untitled%201.png)

Anything that's a method can be overridden

When overriding the functionality of methods it's best to follow the general usage of standard libraries.

### The `<<` shift methods

```ruby
class Library
  attr_accessor :library
  def initialize
    @library = []
  end

  def <<(item)
    library.push(item)
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
  end
end

book1 = Book.new("Pride and Prejudice", "Jane Austen")
book2 = Book.new("Harry Potter and the Philosopher's Stone", "JK Rowling")
my_library = Library.new

my_library << book1
my_library << book2
```

By creating a `Library#<<` method we can easily add items to the `Library` object.

### Element getter and setter methods

The syntax for using `Array#[]` and `Array#[]=` methods without syntactical sugar are:

```ruby
def [](idx)
  array[idx]
end

my_array.[](2)
# with syntactical sugar:
my_array[2] 

def []=(idx, obj)
  array[idx] = obj
end

my_array.[]=(4, 'five')
# with syntactical sugar:
my_array[4] = 'five'
```