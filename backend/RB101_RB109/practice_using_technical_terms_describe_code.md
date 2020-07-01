## Practice using technical terms when describing code

1. Describe this code:
```
a = 'hello'
b = a
a = 'goodbye'
```
On `line 1` the local variable `a` has been initialized and assigned to it is a string object with the value `'hello'`.
The local variable `a` now references the string object `'hello'`.

On `line 2` the local variable `b` has been initialized and assigned to it is a string object referenced by the local variable `a`.
Local variables `a` and `b` both point to the same object.

On `line 3` local variable `a` is re-assigned to a string object with the value `'goodbye'`. Local variables `a` and `b` no longer point to the same object.


2. Describe this code:
```
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```
On `lines 1-8` the method `example` is defined The method is defined with one parameter, `str`. On `line 10` the method `example` is called with the string `'hello'` passed in as an argument. 

On `line 2` the local variable `i` is initialized and assigned to it is an integer with the value `3`.

On `line 3` the `Kernel` module method `loop` is called with a block passed in as an argument. The block is enclosed with a `do..end` statement. 

On `line 4` the `Kernel` module method `puts` is called with the local variable `str` passed in as an argument.

On `line 5` the local variable `i` is reassigned. `i -= 1` is an example of Ruby syntactical sugar. An alternative method of expressing the code is `i = i - 1`, which itself could be expressed as `i = i.-(1)`. The local variable `i` is being assigned the return value of the `Integer#-` method called onlocal variable `i` with the integer `1` passed in to `-` as an argument. 

On `line 6` the reserved word `break` is used to terminate the `loop` if the conditional statement `i == 0` evaluates to `true`. This means the `loop` will `break` if the object referenced by local varaiable `i` is equal to `0`.

On `line 7` the block argument is closed with the reserved work `end`. 

On `line 8` the method definition is closed with the reserved word `end`.

The `example` method will output the string `'hello'` three times and return `nil`.
