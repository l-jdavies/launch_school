# Collaborator Objects

Instance variables can hold any object, including data structures like arrays or hashes.
```ruby
class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end
end
```

Instance variables can also be set to an object of a custom class we have created.
```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
```
In the example above the `@pet` instance variable is declared using the `attr_accessor` method but it isn't assigned a value by the `initialize` method. Instead the `pet` setter method is used to assign the object `bud`, which is a `Bulldog` class object, to `bob`'s `@pet` instance. When we call `bob.pet` a `Bulldog` object is returned.

```ruby
bob.pet                       # => #<Bulldog:0x007fd8399eb920>
bob.pet.class                 # => Bulldog
```

And because a `Bulldog` object is returned, we can chain any `Bulldog` methods:
```ruby
bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"
```
Objects that are stored as state within other objects are called **collaborator objects**. They are called this because they work in *collaboration* with the class they are associated with.

In the example above `bob` has a collaborator object(`bud`) stored in the `@pet` instance variable. To access any of the methods in the `Bulldog` class, then we can access them via the `bob` object then call the required method on the object stored in `@pet`, e.g. `speak` or `fetch`.

Collaborator objects are usually custom objects i.e. defined by the programmer rather than inherited from the Ruby core library. However, remember that even a string object stored within an instance variable assigned to an object, is technically a collaborator object.


