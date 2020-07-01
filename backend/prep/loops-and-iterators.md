## Loops

* The `break` keyword will exit a loop; code after `break` will not be executed.
* Doesn't exit the program, only the loop.

* Example of **conditional loop**:
```

i = 0
loop do
  i += 2
  puts i
  if i == 10
    break
  end
end

```
* The keyword `next` skips over the rest of the current iteration and starts executing the next iteration.
```
i = 0
loop do
  i += 2
  if i == 4
    next
  end
  puts i
  if i  == 10
    break
  end
end
```
* A **while loop** is given a parameter that evaluates to a boolean. Once the boolean expression is `false` the loop is not execuated again and the programme continues. 

```
x = gets.chomp.to_i

while x >= 0
  puts x
  x = x - 1
end

puts "Done!"
```
* `x = x - 1` can be refactored to `x -= 1`
* While loops have the risk of infinite loop.
* Alternative to while loops is **until loops**.
```
x = gets.chomp.to_i

until x < 0
  puts x
  x -= 0
end

puts "done!"
```
* **do/while** loop has important difference to while loop - code is executed once before any conditional checks are performed i.e. the conditional checked is placed at the end of the loop rather than the start.
* Can be used when you want to repeatedly perform an action based on a condition but want the action to be executed at least once, regardless of condition.
```
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end
```
* Note the while loop uses the reserve word `while` where as the do/while loop above uses `loop` and the `break` condition is at the end.

* **for loops** loop over a collection of elements.
* No risk of infinite loop because there's a finite number of elements.
* Begins with reserved word `for` followed by a variable then `in` then collection of elements.
```
x = gets.chomp.to_i

for i in 1..x do
  puts i
end

puts "Done!"
```
* A for loop will return the collection of elements after it executes - the other whileloops return `nil`. 
* Most Rubyists use iterators instead of loops.

## Conditionals within loops
* Add conditional flow control within loops:
```
x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end
```

## Iterators

* Iterators are methods that naturally loop over a given set of data and allow you to ooperate on each element in the collection.
```
names = ['Bob', 'Joe', 'Steve', 'Janice']
x = 1

names.each do |name| puts name
  puts "#{x}. #{name}"
  x += 1
end
```

* The variable is called `name` and placed between two pipes, followed by the logic operated on the variable.

## Recursion
* Recursion is the act of calling a method from within itself.
* The key concept with recursion is that there is a baseline condition that returns a value, which then unwinds the recursive calls. Successive recursive calls build up until some value is returned, only then can the recursive calls be evaluated.
```
# Fibonacci sequence = each number is sum of the two preceeding ones, starting from 0 and 1

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)
```
![recursion_tree](https://github.com/l-jdavies/images/blob/master/recursion_tree.JPG)

* Helpful article that breaks down recursion: https://medium.com/ambitions-of-a-recovering-salesman/3-simple-steps-for-writing-recursive-methods-in-ruby-or-any-other-language-3d6ee72c0bbc
