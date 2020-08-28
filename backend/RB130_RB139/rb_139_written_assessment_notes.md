# Study guide

## What is a closure?

A closure refers to an unnamed "chunk of code" that can be executed at a later time. A closure retains reference to it's artifacts (refers to any variables, constants and methods in scope) at the time of initialization and creates an "enclosure" around them, so they can be referenced later when the closure is executed.

Ruby implements closures through blocks, `Proc` objects and lambdas.

## Closures and scope

A closure retains reference to it's artifacts (refers to any variables, constants and methods in scope) at the time of initialization and creates an "enclosure" around them, so they can be referenced later when the closure is executed.

For example:

```ruby
def exclaim(array)
  array.map {|item| yield(item)}
end

value = '!!!'

p exclaim(["hi", "bye"]) { |n| n + value }

value = '!'
```

When the block `{ |n| n + value }` was created, the local variable `value` had been initialized and assigned the the value `'!!!'` . The local variable `value` is now part of the binding for the block. When the `exclaim` method is executed and yields to the block passed in as an implicit parameter, the object referenced by the block variable `value` is the String `'!!!'` . Although the local variable `value` has been reassigned to `'!'` , this occurs after the block has been executed. At the time of block execution `value` references a String object with the value `!!!`. Therefore, this code will return `["hi!!!", "bye!!!"]`. 

In this example:

```ruby
def exclaim(array, block)
  value = '!'
  array.map(&block)
end

value = '!!!'

new_proc = Proc.new  { |n| n + value  }

value = '...'

p exclaim(["hi", "bye"], new_proc)
```

On line 6 the local variable `value` was initialized and assigned the String object `'!!!'` . On line 8 a `Proc` object was instantiated with a block `{  |n| n + value }` and assigned to the variable `new_proc`. The local variable `value` was in scope at the time of the `Proc` object instantiation, so `value` is part of the `new_proc` 's binding. On line 12 the `exclaim` method was invoked with two arguments, an array and the `new_proc` object. Within the `exclaim` method, `new_proc` is assigned to the parameter `block`, which is converted into a block and passed in to the `map` method. The `map` method will `yield` to the block, resulting in block execution. The conversion of a `Proc` into a block does not change the enclosure, therefore the block's bindings are the same as the `Proc` object's bindings. At the time of block execution, the block parameter `value` references the String object `'...'` because `value` was re-assigned on line 10, before the `exclaim` method invocation. Therefore this code will return `["hi...", "bye..."]`. 

 

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)
# "hi Griffin III"
# => nil
```

## When would we use blocks?

Two main benefits of passing in blocks to methods:

1. If we want to defer some aspects of method implementation to the time of method invocation. This enables 'generic' methods to be created that have greater re-usability because the methods will have greater flexibility. An example of Ruby core methods that use blocks to defer implementation until method invocation are the `Array` class methods `map`, `each` and `select`, which are class specific implementations of `Enumerator` class methods.
2. Sandwich code. This refers to methods that perform a 'before' and 'after' action. The action that occurs between the 'before' and 'after' functions can be determined by a block at method invocation. An example of sandwich code:

```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }                    
# It took 3.003767 seconds.
# => nil
```

## Blocks as implicit and explicit parameters

A block can be passed in to all Ruby methods by default. It is the method implementation that determines whether or not the method utilises the block. Methods can take blocks as explicit parameters or implicit parameters. When a block is passed into a method as an implicit parameter, the block is not assigned to any variable within the method. The method can't use the block for anything other that checking if a block was passed in (using the `Kernel#block_given?`) method and executing the block from within the method, using the `yield` keyword. Example of a method utilising a block passed in as an implicit parameter:

```ruby
def method_with_block
  puts "Hello from the method"
  yield if block_given?
end

method_with_block { puts "Hello from the block"}
# Hello from the method
# Hello from the block
# => nil

method_with_block
# Hello from the method
# => nil
```

Invoking the `method_with_block` method with a block will output `Hello from the method` `Hello from the block` and return `nil` .

Methods that take blocks as explicit arguments are defined with the last parameter preceded by a unary operator `&` . For example:

```ruby
def method_with_explicit_block(&explicit_block)
  puts "Hello from the method"
  explicit_block.call
end

method_with_explicit_block { puts "Hello from an explicit block" } 
# Hello from the method
# Hello from an explicit block
# => nil

method_with_explicit_block 
# Hello from the method
# NoMethodError (undefined method `call' for nil:NilClass)
```

When a block is passed in to the `method_with_explicit_block` method, the `&` operator converts the block into a simple Proc object and assigns to the variable `explicit_block` . An explicit block is executed by invoking the `Proc#call` method on the handle the block was assigned to, in this example `explicit_block` . The benefit of using blocks as explicit parameters is the block can be passed into other methods for execution. For example:

```ruby
def another_method(arg)
  n = 10
  arg.call(n)
end

def first_method(&block)
  another_method(block)
end

first_method { |x| x * 2 }
```

The `first_method` method is invoked with a block as an explicit parameter. Within the `first_method` the block parameter is converted into a Proc object and assigned to the parameter `block` . On the first line of `first_method` , the `another_method` method is invoked, with the Proc object referenced by `block` passed in as an argument. Within the `another_method` the Proc object referenced by `block` is assigned to the parameter `arg`. The `Proc#call` method is invoked on `arg` from `another_method` with the method local variable `n`, which was initialized within the method and references the Integer `10` , passed in as an argument. This invokes the block that was initially passed in to the `first_method` method and within the block, the block parameter `x` references `n` . Therefore the `first_method` invocation shown here will return the Integer `20` .  

## Return value of yielding to the block

Within a method, the return value from yielding to an implicit block can be stored in a local variable and utilised within the method. For example:

```ruby
def multiply(num)
  before = num
  after = yield(num)
  puts "Multipling the number #{before}, produces #{after}!"
end

multiply(5) { |n| n * 2 } 
# Multiplying the number 5, produces 10!
```

The return value of a block is determined by the last line of code executed therefore, it's important to ensure a block doesn't return `nil` when utilising the block return value e.g.

```ruby
def multiply(num)
  before = num
  after = yield(num)
  puts "Multipling the number #{before}, produces #{after}!"
end

multiply(5) { |n| puts (n * 2) } 
# Multiplying the number 5, produces  !
```

## Methods that use Procs

```ruby
def method_with_proc(obj)
  val = 10
  obj.call(val)
end

number = 20

my_proc = Proc.new { |n| n + number }

method_with_proc(my_proc)
# => 30
```

A `Proc` object has been instantiated with a block and assigned the the variable `my_proc` . The method `method_with_proc` has been invoked with one argument, the Proc object `my_proc` . Within the `method_with_proc` method, `my_proc` will be assigned to the parameter `obj` . On line 2 of `method_with_proc` a method local variable `val` is initialized an assigned the integer `10` . On line 3 of the method the `Proc#call` method is invoked, with the variable `val` passed in as an argument. This will execute the block within the `my_proc` object and `val` will be assigned to the block parameter `n` . The local variable `number` is part of the `my_proc` bindings, so `number` within the block references the integer `20`. The `method_with_proc(my_proc)` invocation will therefore return `30` .

## Use of the unary operator `&`

### At method invocation

When we want to transform all elements in a collect for example:

```ruby
[1, 2, 3, 4, 5].inject do |accum, num|
  accum + num
end
# => 15
```

we can achieve the same process with the syntactical sugar:

```ruby
[1, 2, 3, 4, 5].inject(&:+) 
# => 15
```

The mechanism at work here is:

1. Prepending an object with `&` tells Ruby to convert the object into a block. To this the object needs to be a `Proc` . So first, Ruby checks if the object prepended by `&` is a block. If it isn't then it calls the `#to_proc` method. If the `#to_proc` method doesn't return a `Proc` then a `TypeError` will be returned.
2. Note the `inject` method was passed in as a Symbol, so the `Symbol#to_proc` method could be invoked. 
3. Once the object is a `Proc` , the `&` will turn the `Proc` into a block.

Invoking the `Symbol#to_proc` method on `:inject` will return a `Proc` object based on the symbol. Inside the `Proc` , the symbol is converted into a method. That means if the `Proc` object is called, it will invoke the method that was converted from the original symbol. This syntax can only be used on methods that don't take arguments. 

### At method definition

When a method is defined with the unary operator `&` prepended to the last method parameter, that indicates the method takes an explicit block. The `&` operator will convert the block into a simple Proc object and assign it to the variable specified after the `&` operator. For example:

```ruby
def method_with_explicit_block(&explicit_block)
  puts "Hello from the method"
  explicit_block.call
end

method_with_explicit_block { puts "Hello from an explicit block" } 
# Hello from the method
# Hello from an explicit block
# => nil
```

## Purpose of Minitest

Testing is performed to prevent regression. It's the process of ensuring any new code hasn't caused any issues that prevent existing code from working correctly.

## Installing Minitest

Minitest is Ruby gem

## Minitest v RSpec

Minitest is a default testing library that comes with Ruby. In terms of functionality Minitest and RSpec achieve the same things but they use different syntax. Minitest uses Ruby whereas RSpec uses a domain specific language(DSL). Minitest has two syntax styles, **assertion or assert-style** syntax and **expectation or spec-style** syntax. The expectation style mimics RSpec syntax.

## Minitest terminology

**Test suite**: refers to all of the tests carried out on an application 

**Test**: describes the individual testing situation

**Assertion**: the verification step to confirm the application returns the expected output. This could be a value or error message etc.

## Performing Minitests

A testfile is created by requiring the `minitest/autorun` gem and requiring the application to be tested, using `require_relative` . A test class needs to be defined, which is a subclass of `MiniTest::Test` . You can create a `setup` instance method that will be executed each time you perform a test. One use of the `setup` method is to create an instance of the class being tested and storing it in an instance variable. A `setup` method is optional. The instance variable can be accessed by each test in the test suite, saving you from creating a new class instance for each test you perform. Tests are created by implementing instance methods that start with `test_`.  If an assertion is performed within a test, the test passes if the assertion evaluates to `true` i.e. is 'truthy'. If a refutation is performed within a test, the test passes if the refutation evaluates the `false` i.e. is 'falsy'. Once the test suite is complete you can have an optional `teardown` method that can clean up files or close a database connection.

## SEAT approach

1. Set up the necessary objects
2. Execute the code against the object we are testing
3. Assert the results of the execution
4. Tear down and clean up any lingering artifacts

## Purpose of core tools

### Rubygems

Gems are packages of code that can be shared, downloaded, installed and used by Ruby.

### Gemfile

A `Gemfile` is configuration file used by Bundler to determine the specific dependencies required by a project. It contains details on what Rubygems are required for an application an where Bundler should obtain them from. The `Gemfile` can also specify which version of Ruby should be used for the application. This is optional but recommended. 

Example of a `gemfile` :

```ruby
source 'https://rubygems.org'

ruby '2.5.0'

gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
gem 'stamp', '~> 0.6'
gem 'rake'
```

### Bundler

Bundler is a dependency manager that can be used to configure which Rubygems and which version of Ruby are required to run an application. The application dependencies are specified in a `Gemfile`. When `bundle install` is executed, Bundler will installs the Gems specified in the `Gemfile` and then create a `Gemfile.lock`, which looks like this:

```ruby
 GEM
  remote: https://rubygems.org/
  specs:
    ansi (1.5.0)
    builder (3.2.4)
    minitest (5.14.1)
    minitest-reporters (1.4.2)
      ansi
      builder
      minitest (>= 5.0)
      ruby-progressbar
    rake (13.0.1)
    ruby-progressbar (1.10.1)
    stamp (0.6.0)

PLATFORMS
  ruby

DEPENDENCIES
  minitest (~> 5.10)
  minitest-reporters (~> 1.1)
  rake
  stamp (~> 0.6)

RUBY VERSION
   ruby 2.5.0p0

BUNDLED WITH
   2.1.4
```

Any time a `Gemfile` is updated, `bundle install` should be run to force an update of the `Gemfile.lock` file.

When using Bundle in an application, the Bundle gem must be required by the application `require bundler/setup` . This must be the first `require` statement specified. 

### Rake

Rake is a Rubygem that can be used to automate commonly performed functions such as setting up directories or performing tests. Rake uses a `Rakefile` that is stored in the working directory of a project and specifies what tasks should be performed by Rake and how to perform them. A `Rakefile` uses the method `desc` to output a description of the task and `task` method that takes a symbol, which is the name of the task and a block, which specifies how the task should be implemented.

The Rake Gem needs to be added to your `Gemfile` and installed by Bundle (`bundle install`) 

Notes from course material:

- We used `bundle exec rake` instead of just `rake`; you should use `bundle exec rake` whenever you use Rake with a project that uses Bundler.
- `bundle exec rake -T` displays a list of all tasks associated with your `Rakefile`. Here, we just have the `:hello` task that we added to our `Rakefile`. Note that it prints the task name without the colon (`:`).
- The command displays all the known tasks (just `hello` in this example) with their descriptions from the `desc` statement.
- Although you use `bundle exec rake` to run the `rake` command, Rake itself is not a component of Bundler. We use `bundle exec` just to make sure we're using the Bundler environment with any code we run from `Rakefile`.

Example of a `Rakefile` :

```ruby
require 'rake/testtask'
require 'bundler/gem_tasks'
require 'find'

desc 'Say hello'
task :hello do
    puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'List files'
task :files do
  Find.find('.') do |file|
  next if file.include?('/.')
  puts file if File.file?(file)
  end
end
```