When running the following code...

```
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
```

We get the following error...

```
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
```
Why do we get this error and how do we fix it?


This is because the instance variable `@name` was instantiated with the method `attr_reader`, which only provides access to the *getter* methods, not the *setter*. For access to the setter methods, `@name` should have been instantiated with the `attr_accessor` method instead.

