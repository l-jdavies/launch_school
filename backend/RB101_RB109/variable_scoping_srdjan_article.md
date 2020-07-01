1. Without running the code try to answer what will this code example output:
```
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
The code will output the local variable `a` which references the integer `5`. `puts b` will result in an error because local variable `b` cannot be accessed outside of the inner scope, defined by the `do..end` block.

Local variables initialized in the outer scope can be accessed in the inner scope. However, variables initialized in the inner scope cannot be accessed in the outer scope.

2. Without running the code try to answer what will this code example output :
```
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
The code will output `3` and `2`. 

The local variable `a` was initialized on `line 1` and assigned to it was an integer with a value of `4`. On `line 4` the `loop` method was called and a `do..end` block was passed into the method as an argument. Within the `do..end` block the local variable `c` was initialized and an integer with the value `3` was assigned to `c`. Local variable `c` was initialized in the inner scope. On `line 6` the local variable `a` was reassigned. The integer object referenced by local variable `c` was assigned to local variable `a`. 

On `line 7` the `loop` method was terminated by the reserved word `break`. This loop will return `nil`. That is because the return value of the loop is determined by the return value of `break`, which in this case returns `nil`.

The return value of this code block will be `nil` because the return value of `puts` is `nil`. 
