# Assertions

A large number of different assertion methods are available ([http://docs.seattlerb.org/minitest/Minitest/Assertions.html](http://docs.seattlerb.org/minitest/Minitest/Assertions.html)), some of the common ones are:

[Untitled](https://www.notion.so/3990808615044533b5a0dbebc8dc62e7)

## Examples of assertions:

We will run different assertions on this code:

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end
```

1. `assert`

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_car_exists
    car = Car.new
    assert(car)
  end
end

# No errors
```

2. `assert_equal`

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end

# No errors 
```

3. `assert_nil`

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_my_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end
end

# no errors
```

4. `assert_raises`

```ruby
def test_raise_initialize_with_arg
  assert_raises(ArgumentError) do
    car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
  end
end
```

5. `assert_instance_of`

```ruby
def test_instance_of_car
  car = Car.new
  assert_instance_of(Car, car)
end
```

6. `assert_includes`

```ruby
def test_includes_car
  car = Car.new
  arr = [1, 2, 3]
  arr << car

  assert_includes(arr, car)
end

# assert_includes calls assert_equal in its implementation, and Minitest counts that call
# as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.
```

## Refutations

Refutations are the opposite of assertions. `refute` passes if the object you pass to it is falsey. Every assertion has a corresponding refutation.

## Further reading

[Assert Yourself: A Detailed Minitest Tutorial](https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest)