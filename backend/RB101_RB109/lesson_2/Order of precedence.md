# Order of precedence

Using parenthesis overrides the default evaluation order of code and evaluates the code inside the parenthesis first, without regard to mathematical precedence rules. When in doubt use parenthesis. **Parenthesis should be used in all but the most simplest of code**.

## do..end versus { } blocks

Blocks have the lowest precedence of all operators and between `do..end` and `{ }` , `{ }` has a higher precedence. This can have significant and unexpected consequences when invoking methods. Take these two examples:

```ruby
 array = [1, 2, 3]

p array.map { |num| num + 1 }      #  outputs [2, 3, 4]
                                   #  => [2, 3, 4]

p array.map do |num|
  num + 1                   #  outputs #<Enumerator: [1, 2, 3]:map>
end
```

By examining the code you'd think they'd have the same output, the only difference is how the block have been passed in, but they don't.

That's because the `do..end` block has the lowest precedence and so is executed last. That means `array.map` is executed first, which returns an `Enumerator` and that gets passed into `p` with the `do..end` block as an argument. However, `p` doesn't take an argument so the block is just ignored.

Conversely with `p array.map { |num| num + 1 }` the code within `{ }` is executed first and the output is passed into `map` as the argument, rather than `p`.   

Using parenthesis, this is what's happening:

```ruby
array = [1, 2, 3]

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
                                    # => [2, 3, 4]
```

 You can over-ride that order of precedence by using parenthesis.