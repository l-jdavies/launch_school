# Equivalence

```ruby
str1 = "something"
str2 = "something"
str1 == str2            # => true

int1 = 1
int2 = 1
int1 == int2            # => true

sym1 = :something
sym2 = :something
sym1 == sym2            # => true
```

There's nothing unexpected in the code above but think about the process you're actually performing here - what are you comparing, two objects or the value the objects point to? We know it's actually the object **value** that's being compared, not the objects themselves.

If you want to compare the actual objects then we need to perform a comparison with the `equal?` method.

```ruby
str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false
```

The `str1` and `str2` object values are the same so performing a comparison using the `==` method evaluates to `true` but `str1` and `str2` are two separate objects so performing a comparison with `equal?` returns `false`. `str1.equal? str1_copy` returns true because `str1` and `str1_copy` point to the same object.

## The `==` method

`==` is an instance method. Due to Ruby's syntactical sugar it can be used like this `str1 == str2` rather than `str1.==(str2)`

How does `==` know what value to use when performing a comparison? It's determined the by class of the calling object. `==` is defined in the `BasicObject` class, which is a parent for all classes in Ruby. This means every object can access the `==` method but **each class should override the `==` method to specify which values should be compared.**

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => false

bob_copy = bob
bob == bob_copy            # => true
```

This demonstrates the default implementation for `==` is the same as the `equal?` method - we are determining if `bob` and `bob2` are the same objects. If we want to determine if `bob` and `bob2` objects both have the same `name` variable, then we can override `==`

```ruby
class Person
  attr_accessor :name

  def ==(other)
    name == other.name     # relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => true
```

This uses the `String#==` method to compare the name variables. Almost every Ruby core library class has it's own version of `==` so you can use `==` to compare `Array`, `Hash`, `String` and `Integer` objects.  

```ruby
45 == 45.00
# true

45.00 == 45
# true
```

This is possible because although we are comparing an `Integer` with a `Float` both of those classes have an implementation of the `==` method that permits this usage.

When you define a `==` method, you also get a `!=` method for free.

## `===`

`===` is another instance method, which is implicitly used by the `case` statement.

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

The `case` statement uses `===` method to compare each `when` clause with `num`. In this example the `when` clauses are ranges, so the `Range#===` method is implemented. When `===` compares two objects it's essentially asking "if `(1..50)` is a group, would `25` belong in that group?'. 

The same concept can be shown here:

```ruby
String === 'hello'
# true (because 'hello' is an instance of a String)
'bob' === 'hello'
# false
'hello' === 'hello'
# true (because they have the same value)
Integer === 25
# true
String === 25
# false
```

Note, you don't usually need to override the default behaviour of `===` as it's unlikely you'd use a custom case in a `case` statement. 

## `eql?`

The `eql?` method determines if two objects are both the same value and the same class. It's most often used by `Hash` to determine equality among it's members.

```ruby
'Hello'.eql?('Hello')
# true

String.eql?('Hello')
# false (Hello is an instance of the String class but they don't have the same value)
```