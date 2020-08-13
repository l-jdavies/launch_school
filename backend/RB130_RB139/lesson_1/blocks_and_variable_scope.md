# Blocks and variable scope

Remember the local variable scope rules for blocks are that variables initialized in the outer scope are available in the inner scope but not vice versa. This is due to the concept of closures.

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)

# hi Griffin III
# => nil
```

In the example above we have initialized a new `Proc` object with a block and assigned it to the variable `chunk_of_code` . `chunk_of_code` is passed in to the `call_me` method and `chunk_of_code` is executed. The local variable `name` was initialized outside of the method and we know that local variables initialized outside of a method can't be accessed within a method unless they are passed in. So how did the `Proc` object evaluate `#{name}` to the String `Griffin III`? It's because a `Proc` object keeps track of it's surrounding artifacts (it's bindings) and they become enclosed with the object. This means whenever the `Proc` is executed, it still has access to the bindings present at initialization so it can execute correctly. The bindings can be local variables, method references, constants - whatever it needs to execute.

The fact `Proc` objects enclose it's bindings enables the code to execute correctly, even if it seemingly violates scoping rules. `Proc` objects will bind everything that is in scope at the time of the `Proc` objects instantiation. If the code above was written like this:

```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)

# undefined local variable or method `name'

```

The `name` variable was initialized after the `chunk_of_code` proc object was instantiated, therefore it wasn't in scope and isn't part of the object's bindings.