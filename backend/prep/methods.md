## Definining methods
![image](https://github.com/l-jdavies/images/blob/master/method_definition.jpg)

* Parameters are used when you have data outside of the method definition scope that you want to access within the method definition
* The parameter is a local variable
* When a method is called, an argument is passed to the method
* The argument is assigned to the local variable, specified as the parameter
* The code within the method definition is execuated with the local variable evaluated to the argument

## Default parameter
![image](https://github.com/l-jdavies/images/blob/master/default_parameters.jpg)

## Method definition and local variable scope
* A method definition creates its own scope outside the regular flow of execution
* That's why local variables within a method definition cannot be accessed outside of the method scope
* Also why data has to be passed into a method definition as a parameter
* Don't get confused between **method invocation with a block** and **method definition** when considering local variable scoping issues.

![image](https://github.com/l-jdavies/images/blob/master/method_scope.jpg)

In the above code, we passed in `a` to the `some_method` method. In `some_method`, the value of `a` is assigned to the local variable number, which is scoped at the method definition level. number is reassigned the value "7". Did this affect `a`'s value? The answer is no, because number is scoped at the method definition level and `a`'s value is unchanged. Therefore, we proved that method definitions cannot modify arguments passed in to them permanently.

* **The exception to the rule of variable scope is if a method is used that mutates the caller**
* In that case - the modified variable can be accessed outside of the method definition

## `return`
* Ruby methods always return the evaluated result of the last line of the expression unless an explicit `return` comes before it
* If you place a `return` in the middle of a code block, it will return the evaluated result and code following it will not be executed

## Chaining methods
* Because every method call returns something (even if it's `nil`) methods can be chained together
* Chaining methods is when the return value from one method is used as an argument when invoking the next method

1. Create method that returns a value
```
def add_three(num)
  num + 3
end

add_three(5)
=> 8
```
2. Call another method on the returned value
```
add_three(5).times { puts 'this should print 8 times' }

this should print 8 times
this should print 8 times
this should print 8 times
this should print 8 times
this should print 8 times
this should print 8 times
this should print 8 times
this should print 8 times
=> 8
```
Because `8` is still returned you could keep chaining methods. 
* Chaining methods can be used to write elegant code
```
"hi there".length.to_s
=> "8"
```
* Be careful not to use `puts` when chaining methods - `puts` returns `nil`
* Can get around this by returning the expression after `puts`
```
def add_three(num)
  new_value = num + 3
  puts new_value
  new_value
end
```
* You could use `return new_value` as well, but since `new_value` is the last expression in the method definition, it's being implicitly returned.

## Method calls as arguments
* Ruby lets you pass a method call as an argument to other methods
![image](https://github.com/l-jdavies/images/blob/master/method_as_argument.jpg)


