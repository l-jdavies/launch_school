# Testing equality

When we use `assert_equal` we are testing for **value equality**. Specifically, we are invoking the `==` method on the object. If we want to test for **object equality** then we need to use the `assert_same` assertion.

```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
```

In this example `assert_equal` will pass because `str1 == str2` returns `true` . The `assert_same` assertion will fail and output a message:

```ruby
1) Failure:
EqualityTest#test_value_equality [temp.rb:9]:
Expected "hi there" (oid=70321861410720) to be the same as "hi there" (oid=70321861410740).
```

## Equality with a custom class

Because the Ruby core classes all have a class specific implementation of `==` to test for value equality, we can use `assert_equality` on strings, arrays, hashes etc. but we will run into problems if we use `assert_equals` on custom class objects:

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
```

Running this test will yield:

```ruby
# Running:

CarTest F

Finished in 0.021080s, 47.4375 runs/s, 47.4375 assertions/s.

  1) Failure:
CarTest#test_value_equality [car_test.rb:48]:
No visible difference in the Car#inspect output.
You should look at the implementation of #== on Car or its members.
#<Car:0xXXXXXX @wheels=4, @name="Kim">

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```

The output essentially tells us Minitest doesn't know how to assert value equality for this class.

If we implement a `Car#==` method:

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)                       # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
end
```

Now the `assert_equal` assertion will pass.