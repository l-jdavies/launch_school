# Symbol to proc

When working with collections we often want to perform an action on all elements in the collection, like this:

```ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end
```

A short cut for writing that is this:

```ruby
[1, 2, 3, 4, 5].map(&:to_s)
```

Note the argument passed into the `map` method is the `to_s` method as a symbol `:to_s` prepended with `&` .

The mechanism at work here is:

1. Prepending an object with `&` tells Ruby to convert the object into a block. To this the object needs to be a `Proc` . So first, Ruby checks if the object prepended by `&` is a block. If it isn't then it calls the `#to_proc` method. If the `#to_proc` method doesn't return a `Proc` then a `TypeError` will be returned.
2. Once the object is a `Proc` , the `&` will turn the `Proc` into a block.

Invoking the `Symbol#to_proc` method on `:to_s` will return a `Proc` object based on the symbol. Inside the `Proc` , the symbol is converted into a method that accepts arguments passed to it. That means if the `Proc` object is called, it will invoke the method that was converted from the original symbol.

```ruby
1 def my_method
2   yield(2)
3 end
4
5 my_method(&:to_s)
```

On line 5 the `my_method` method is invoked with an implicit block parameter. On line 1 we invoke `my_method` which doesn't have any parameters. On line 2 the keyword `yield` means we yield to the block parameter, with the integer `2` passed in as an argument. On line 5 the `&` symbol checks if the `:to_s` object is a `Proc`. It is not so the method `Symbol#to_proc` is invoked. `&` now converts the `Proc` object into a block `{ |num| num.to_s }` and `2` is assigned to the block parameter. The `Proc` object invokes the `to_s` method, converting the Integer into a String.

Note the role of `&` differs at method invocation to the role of `&` in method implementation.

At method implementation `&` turns a block into a simple `Proc`

At method invocation `&` turns a `Proc` into a block