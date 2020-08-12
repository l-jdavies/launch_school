# Blocks

## Summary

---

- blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
- blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.
- blocks return a value, just like normal methods.
- blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.
- blocks are a good use case for "sandwich code" scenarios, like closing a `File` automatically.

## Closures

---

A closure is a general programming concept that allows programmers to save a 'chunk of code' and execute it another time. It's called a closure because it's said to bind its surrounding artifacts (variables, objects, methods etc) and build an enclosure around everything, enabling them to be referenced when the closure is executed. Closures can be thought of as methods that can be passed around an executed but they aren't defined with an explicit name.

In Ruby closures are implemented through `Proc` objects, lambdas or blocks. The benefits of using closures comes from the ability to pass them into existing methods.

Closures retain reference to its surrounding artifacts - its **binding**.

## Writing methods that take blocks

---

### Passing in blocks as implicit parameters

All Ruby methods take a block by default - the method implementation determines how/if the block is utilised.

```ruby
def hello
  "hello!"
end

hello
#=> hello!

hello { puts "goodbye!" }
#=> hello!
```

This demonstrates that it you implicitly pass a block into a method, it doesn't result in an error, the block is just ignored. This differs from calling a method with an incorrect number of arguments.

```ruby
def echo(str)
  str
end

echo                                          
# => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!")                                
# => "hello!"
echo("hello", "world!")                       
# => ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
echo { puts "world" }                         
# => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!") { puts "world" }               
# => "hello!"
echo("hello", "world!") { puts "world" }      
# => ArgumentError: wrong number of arguments (2 for 1)
```

### Yielding

One way of invoking blocks that are passed into methods as implicit parameters from within the method is to use the `yield` keyword.

```ruby
def echo_with_yield(str)
  yield
  str * 3
end

echo_with_yield { puts "world" }
# => ArgumentError: wrong number of arguments (0 for 1)

echo_with_yield("hello!") { puts "world" }
# world!
# => "hello!hello!hello!"
```

The first method call demonstrates the number of arguments passed into a method at invocation needs to match the number of parameters defined during method implementation, regardless of if a block is passed in or not.

The second method call shows the `yield` keyword caused the block to be executed, which printed `"world"` to the terminal. Once the block finished executing, the next line of the method was executed, which caused the string `"hello!hello!hello!"` to be returned.  

If you use `yield` within a method definition but don't pass in a block during method invocation, you will return a `LocalJumpError`:

```ruby
echo_with_yield("hello!")                          
# => LocalJumpError: no block given (yield)
```

In order to enable a method to be called both with and without a block, we can utilise the method `Kernel#block_given?` :

```ruby
def echo_with_yield(str)
  yield if block_given?
  str * 3
end
```

### Passing execution to the block

```ruby
1 # method implementation
2 def say(words)
3   yield if block_given?
4   puts "> " + words
5 end
6
7 # method invocation
8 say("hi there") do
9   system 'clear'
10 end
```

Describing the process of method invocation:

1. On line 8 the `say` method is invoked with two arguments: a string and a block. The block is being passed in as an implicit parameter.
2. Execution moves to line 2 where the `say` method parameter `words` is assigned the string `"hi there"` . Because the block is an implicit parameter it is not assigned to any variable. 
3. On line 3 a conditional check is performed. The `block_given?` method will return `true` , which causes the keyword `yield` to yield execution of the method to the block.
4. On line 9 the block is executed, which clears the screen and on line 10 the block finishes executing and we move back into the method.
5. Line 5 is now executed, printing the string `>` concatenated with the string assigned to `words`
6. The method invocation on lines 8-10 will result in `> hi there` being printed to the terminal and will return `nil.`  

### Yielding with an argument

```ruby
do |num|
  puts num
end
```

`|num|` is a block parameter and within the block `num` is described as a block local variable. The scope of this variable is restricted to the block. When defining block parameters be careful to avoid variable shadowing.

```ruby
# method implementation
def increment(number)
  number + 1
end

# method invocation
increment(5)
```

In the example above the `increment` method just returns the argument value incremented by 1. If we want to extend the usage of this method then we can implement the option to yield to a block:

```ruby
1 # method implementation
2 def increment(number)
3   if block_given?
4     yield(number + 1)
5   end
6   number + 1
7 end
8
9 # method invocation
10 increment(5) do |num|
11   puts num
12 end
```

We can describe the process that will occur at method invocation:

1. On line 10 the `increment` method is invoked with two arguments - an integer (`5`) and a block.
2. On line 2 the `increment` method will be invoked with the parameter `number` assigned the integer `5`. The block was passed in as an implicit parameter, so it is not assigned to any variable.
3. On line 3 a conditional statement is executed. The `Kernel#block_given?` method will evaluate to `true` so we will yield to the block. On line 3 an argument, `number + 1` was passed into `yield` . Now, when execution moves to the block on line 10, the block parameter `num` is assigned the return value of `number + 1` , which in this example will be `6` .
4. On line 11 `puts num` will output `6` to the terminal.
5. On line 12 execution of the block is completed.
6. Execution moves back into the method invocation, where line 4 has finished executing. 
7. On line 5 the `if` statement is completed.
8. On line 6 the value of `number` incremented by `1` is returned.
9. On line 7 the method invocation is complete.
10. Therefore this method invocation on lines 10 - 12 will print `6` to the terminal and return `6`

When passing in arguments to `yield` , passing in the wrong number of arguments doesn't raise an `ArgumentError`.

**Passing in two arguments when the block expects one:**

```ruby
# method implementation
def test
  yield(1, 2)                           # passing 2 block arguments at block invocation time
end

# method invocation
test { |num| puts num }                 # expecting 1 parameter in block implementation
# 1
```

Block prints `1` to the terminal and just ignores the second argument.

**Passing in one argument when the block expects two:** 

```ruby
# method implementation
def test
  yield(1)                              # passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2|                    # expecting 2 parameters in block implementation
  puts "*#{num1} #{num2}*"
end
# *1  *
```

The block prints `*1  *` with an empty space where `#{num2}` evaluated to `nil` so an empty string was printed.

The rules around the number of arguments you can pass to a block, `Proc` or `lambda` in Ruby is called it's **arity**. Blocks have lenient arity rules.

### Return value of yielding to the block

Suppose we want to create a method that compares outputs before and after manipulating the arguments to a method:

```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
compare('hello') { |word| word.upcase }
```

This method invocation would output:

```ruby
Before: hello
After: HELLO
# => nil
```

The method stores the return value from the block in the local variable `after` then uses `after` in the method implementation. The method is going to return `nil` because `puts` is the last line executed in the method. This provides flexibility because at method invocation the user can pass in a block that performs a variety of functions and the method will use the return value. 

```ruby
compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el
# => nil

compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything
# => nil
```

As always it's important to focus on the return value of the block i.e. make sure the block doesn't return `nil`.

```ruby
compare('hello') { |word| puts word }

# Before: hello
# hello
# After:
# => nil
```

When the block is executed `hello` is printed to the terminal but the return value of the block is `nil` therefore with `After: #{after}` `#{after}` is an empty string.

### When to use blocks in your own methods

1. Defer some implementation code to a method invocation decision. As demonstrated in the `compare` method above, enabling some of the methods implementation to be determined by the block offers much greater flexibility in how the method is utilised. 
2. Methods that need to perform a 'before' and 'after' action - sandwich code. Sandwich code is a good example of needing to defer some implementation until the point of method invocation. You can create a generic method that performs some 'before' and 'after' action and the method doesn't care what the action that occurs between the 'before' and 'after' actually is - that is determined at invocation:

```ruby
 def time_it
  time_before = Time.now
  yield
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end
```

At invocation the action that is timed by the `time_it` method can be specified by the block passed in as an argument. 

```ruby
def time_it
  time_before = Time.now
  yield                       # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }                    
# It took 3.003767 seconds.
# => nil
```

Another area where sandwich code is useful is in resource management, or interfacing with the operating system. Many interfaces require a developer to first allocate a portion of a resource, then perform a clean-up to free up the resource. Failure to do the clean-up can result in dramatic problems - system crashes, memory leaks or file corruption. It makes sense to automate the clean-up step anytime a process that requires initial memory allocation is completed.

In Ruby, that is what happens with the `File::open` method. 

```ruby
my_file = File.open("some_file.txt", "w+") # creates a file called "some_file.txt" with write/read permissions
# write to this file using my_file.write
my_file.close
```

`my_file.close` closes the file and releases the `my_file` object from hanging on to system resources. Since we always want to close a file after opening it, `File::open` can take a block and will automatically close the file after the block is executed. 

```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```

### Methods with an explicit block parameter

We can implement methods to take an explicit block by defining a parameter prefixed with `&` :

```ruby
def test(&block)
  puts "What's &block? #{block}"
end
```

The `&block` is a special parameter that converts the block argument into a 'simple' `Proc` object.

```ruby
test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```

This shows that when we invoke the `test` method the block was converted into a `Proc` object. The parameter doesn't need to be called `block` it just has to be prefixed with a `&`. 

Using explicit blocks provide greater flexibility. When we use implicit blocks, the block doesn't get assigned to a variable so you can't do much more than check if a block has been passed in and yield to it. However, with explicit blocks, we can pass the block to another method.

```ruby
def test2(block)
  puts "hello"
  block.call   # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2
```

Note that we only need to use the `&` symbol once. Once the `block` parameter is converted into a `Proc` object, it can be referenced as `block` not `&block` . Also note that instead of using `yield` to execute the block, we invoke the `Proc#call` method. We would also use `Proc#call` within `test` if we wanted to execute the block, not `yield`.