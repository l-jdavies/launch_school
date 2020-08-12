# Blocks

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