# Getting started with Minitest

Writing tests prevents regression. It enables use to test that new code works without having to manually verify that everything still works. You can first tests before or after implementation of most likely, a combination of both. This course will cover unit testing.

## RSpec vs. Minitest

Many people use RSpec for testing but Minitest is the default testing library that comes installed with Ruby. In terms of functionality, RSpec and Minitest can achieve the same things but Minitest uses a simpler syntax. RSpec is a Domain Specific Language - it's a DSL for writing tests.

 Minitest has two syntax styles - **assertion or assert-style** syntax and **expectation or spec-style** syntax. The two styles are very different but have the same functionality. Expectation style mimics RSpec syntax. We will use assertion style.

## Installing Minitest

To install Minitest:

```ruby
gem install minitest
```

To verify the installation:

```ruby
require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end
```

To colorize the test results:

```ruby
gem install minitest-reporters
```

In a test file add:

```ruby
require "minitest/reporters"
Minitest::Reporters.use!
```

## Vocabulary

**Test Suite:** the entire set of tests that accompanies your program.

**Test:** the context in which tests are run.

**Assertion:** the verification step to confirm the data returned by your test is as expected.

## Creating a test

Create the file that you want to perform tests on:

```ruby
# car.rb
class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end
```

Create a test file:

```ruby
1 require 'minitest/autorun'
2 require "minitest/reporters"
3 Minitest::Reporters.use!
4
5 require_relative 'car'
6 
7 class CarTest < MiniTest::Test
8   def test_wheels
9     car = Car.new
10     assert_equal(4, car.wheels)
11   end
12 end
```

On lines 1 and 2 we load the gems required to perform the tests. On line 5 we require the file that's being tested, `car.rb` by invoking the `require_relative` method.

On line the test class is created, which is a sub-class of `MiniTest` class. Tests are written by creating instance methods that begin with `test_*` . This naming convention means Ruby knows that these methods are individual tests that need to be run. Within the `test_wheels` method we need an assertion - the thing we are trying to verify. To enable an assertion to be made we need to obtain the required data. In this example we have instantiated a new `Car` class object and assigned it to the local variable `car` .

There are many types of assertions, we are using `assert_equals` . `assert_equals` is an instance method that takes two arguments - the first is the expected value and the second is the test or actual value. If there is a discrepancy between the two values, `assert_equals` will save the error and Minitest will report it at the end of the test run.

You can have multiple assertions within one test (i.e. instance method beginning with `test_`).

## Test output

```ruby
.FS
```

`.` = test passed

`F` = test failed

`S` = test skipped

## Skipping tests

If you don't want to run a certain test, just insert the `skip` keyword at the beginning at the method definition:

```ruby
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
```

## Expectation syntax

With expectation syntax, tests are grouped into `describe` blocks and tests are written with the `it` method. Instead of using assertions, we use *expectation matchers*. 

```ruby
require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4           # this is the expectation
  end
end
```

The output will be the same as when using assertion style, it's just a different syntax.

## Summary

- Minitest is an intuitive test library that comes with Ruby.
- Using Minitest is very easy, and you shouldn't be afraid to play around with it.
- Create a test file
- Create a test class by subclassing `MiniTest::Test`.
- Create a test by creating an instance method that starts with `test_`.
- Create assertions with `assert_equal`, and pass it the expected value and the actual value.
- Colorize Minitest output with `minitest-reporters`
- You can skip tests with `skip`.
- Minitest comes in two syntax flavors: assertion style and expectation style. The latter is to appease RSpec users, but the former is far more intuitive for beginning Ruby developers.