## Conditionals
* All of the examples below are valid uses of the equality operator in Ruby
```
if x == 3
  puts "x is 3"
end

if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
else
  puts "x is neither 3 or 4"
end

if x == 3
  puts "x is 3"
else
  puts "x is NOT 3"


if x == 3 then puts "x is 3" end
```
* `then` is a reserved word that must be used when using one line syntax
* Could also use
```
puts "x is 3" if x == 3
```
* Ruby also has the reserved word `unless`
```
puts "x is NOT 3" unless x == 3
```

## Combining operators
* `&&` is the "and" operator. Expression on the left and right hand side of `&&` must evaluate to `true` for the entire expression to evaluate as `true`
* `||` is the "or" operator. Expression on the left or right hand side must evaluate to `true` for entire expression to evaluate as `true`
* `!=` is the "not operator. Changes the boolean expression to the opposite
```
if x && y || z
  # do something
end
```
* First the x && y statement will be executed. If that statement is true, then the program will execute the # do something code on the next line. If the x && y statement is false, then the z will be evaluated. If the z is true, the code on the next line will be evaluated. If the z is false, then the code will exit the if statement.


## Ternary operator
* A mopre concise version of a simple `if'/else` statement is to use the ternary operator, which uses `?` and `:`
* If the expression to the left of the `?` evaluates to `true` then the code to the right of the `?` will be executed. If it's `false` then the code to the right of the `:` is executed
```
true ? "this is true" : "this is not true"
=> "this is true
```

## Case statement
* Similar functionality to an `if` statement
* First create a `case`, then evaluate the value of the case and finally state what operation should be completed if the case is true
```
a = 5

answer = case a
  when 5
    "a is 5"
  when 6
    "a is 6"
  else
    "a is neither 5, nor 6"
  end

puts answer
```
* Don't forget to use the reserved word `when`
