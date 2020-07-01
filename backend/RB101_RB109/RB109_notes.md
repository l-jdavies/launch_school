## Variable scope
* What do we mean by variable scope?

**A variable's scope determines where in a program a variable is available for use, in other words where it can be accessed. 
There are a number of things which determine the scope of a variable, such as the type of variable, where it was initialized and where you are trying to use it 
(e.g. within a method definition or a block following a method invocation).**


* Inner scope is created by a block

* A block is defined by `{}` or `do..end` reserved words

* The scope of a local variable is determined by where it is initialised. 
Local variables initialised in the outer scope can be accessed in the inner scope 
but local variables initialised in the inner scope cannot be accessed in the outer scope.

* "The block following invocation of the method `loop` creates an inner scope."

* Nested blocks create nested scope

* Nested blocks follow the same rules of inner and outer scoped variables but what's considered
inner and outer scope is relative

* **Method definition** *sets* the scope of local variables by defining parameters, actions performed on
parameters and if/how the method interacts with a block

* **Method invocation** *uses* the scope set by the method definition

* When invoking a method with a block, we aren't limited to just executing code within the block

* Depending on the method definition, the method can use the return value of the block to perform another action

```
a = 'hello'

[1, 2, 3].map { |num| a }
=> ['hello', 'hello', 'hello']
```
* Here the `map` method uses the return value of the block to transform each element in the arrray to the return value of the block

* The branches of a conditional statement (`if/elsif/else`) do not define separate scopes - they are part of the normal execution of the program

* If a local variable is initialised within a conditional branch, the variable is available to the program.
If the conditional branch isn't executed then the value of the local variable if `nil`.
```
a = 5

if false
  b = 'hello'
end

=> b = nil
```

* Variable shadowing in when a block parameter has the same name as a local parameter initialized outside of the block
This prevents the block accessing the local parameter.

## Mutating and non-mutating methods
* A mutating method is a method that changes the return value of the calling object

* Transformation is the result of creating a new value from an old one

* `map` is transformative - each element in the calling object is tranformed based on the return value of the block.
The transformed elements are stored in a new object.

* `map!` is both transformative and destructive because the transformed elements are targeted to the calling object. 

## Definition of `each`, `select` and `map`

### `each`
* `each` calls the given block once for each element in `self`, passing in that element as a parameter.

**Example of code:**
```
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

**Description of code:**
The `Array#each` method is being called on a multi-dimensional array. Each inner array is passed to the block in turn an assigned to the local variable `arr`. The `Array#first` method is being called on `arr`, which returns the object at index position `0`, which in the first iteration of the block is the integer `1`. The return value from `arr.first` is passed into the `String#puts` method, which outputs a string representation of the integer `1`. The return value of `puts` is `nil` and since this is the last evaluated statement within the block, the return value of the block is `nil`. `each`doesn't do anything with the return value. `each` returns the calling object, in this case the nested array.

### `map`
* `map` returns a new array based on the return value of the given block. Each element in the calling object is transformed based on the block's return value.

**Example of code:**
```
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

**Description of code:**
The `Array#map` method is being called on a multi-dimensional array. Each inner array is passed to the block in turn and assigned to the local variable `arr`. The `Array#first` method is called on `arr`, which returns the object at index position `0`. In this example, `arr.first` will return the integr `1` the first time the block is executed. The return value of `arr.first` is passed to the `String#puts` method as an argument. `puts` will output a string representation of the integer and return `nil`. The last evaluated statement in the block is `arr.first`. The return value of this method invocation will determine the return value of the block. The `Array#map` method returns a new array based on the blocks return value. The return value of the block on the first iteration will be the integer `1` and on the second iteration the return value of the block will be the integer `3`. This means the return value of invoking the `Array#map` method of the multi-dimensional array will be a new array containing two elements, the integers `1` and `3` i.e. `[1, 3]`. 

###`select`
* `select` returns a new array based on the blocks return value. If the return value evaluates to `true`, the element is selected.

**Example of code:**
```
[[1, 2], [3, 4, 5]].select do |arr|
  arr.size > 2
end
```

**Description of code:**
The `Array#select` method has been called on a multi-dimensional array. Each inner array is passed to the block in turn and assigned to the local variable `arr`. Within the block the `Array#size` method has been called on `arr`. This method returns the number of elements present in the calling object. On the first execution of the block, the return value of `arr.size` will be the integer `2`. The `Integer#>` method has been called on the return value of `arr.size`. This is an example of method chaining. The code `arr.size > 2` is an example of syntactical sugar. An alternative way of displaying this code is `arr.size.>(2)`. The Integer `2` has been passed into `Integer#>` method as an argument. The `Integer#>` method returns a boolean value. It will return `true` if the return value of `arr.size` is greater than the Integer `2`. On the first iteration of the block, `arr.size > 2` will return `false` because `2` is equal to `2`. On the second iteration of the block `arr.size > 2` will return `true` because the return value of `arr.size` will be `3`. The `Array#select` method returns as new array based on the blocks return value. If the return value evaluates to `true` then the element will be selected. In this example `Array#select` will return a new Array containing the Array object `[3, 4, 5]`. 

## Additional descriptions of code using `each`, `map` and `select`
EXAMPLE 1:
```
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
The local variable `my_arr` has been initialised and assigned to it the return value of the `Array#each` method called on a multi dimensional array. Given the return value of `Array#each` is the object it was called on, the local variable `my_arr` will reference the multi-dimensional array `[[18, 7], [3, 12]]`. The `Array#each` method called on the multi-dimensional has been invoked with a block.Each inner array will be passed to the block in turn and assigned to the local variable `arr`. The `Array#each` method has been called on `arr`. Each element within the inner array assigned to `arr` will be passed into the block in turn and assigned to the local variable `num`. Upon the first iteration of the block, `num` will reference the Integer `18`. Within the inner block, an `if` statement has been used to introduce conditional branching to the code. If the `if `statement `num > 5` evaluates to true, then `puts num` will be executed. If `puts` is executed then a string representation of the integer referenced by `num` will be outputted. The return value of `puts` is `nil` and as `puts num` is the last evaluated expression in the inner block, the inner block return value will be `nil`. The outer block return value is determined by the inner block return value, therefore this is `nil`. This is of no-consequence because `Array#each` does not use the return value of the block. Overall execution of the code will result in the output of the integers `18`, `7` and `12`. The return value will be `nil` and the local variable `my_arr` will point to the Array object `[[18, 7], [3, 12]]`. 

## Sorting and comparison
* Sorting is setting the order of items in an array according to certain criteria

* Sorting is essentially performed by comparing items in a collection with each other and ordering them based on the result of that comparison

* Comparisons are performed with the spaceship operator `<=>`, which is actually a **method - not an operator**.

* `String#<=>` is a different method to `Integer#<=>`

```
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'1' <=> 2 # => nil
```
* `<=>` and therefore `sort` can only be called on objects of the same type

* `String#<=>` performs a comparison based on the position of a string object in the ASCII table

* General rules regarding ASCII:
  - Uppercase letters come before lowercase letters
  - Digits and most punctuation comes before letters
  - There is an extended ASCII table - that comes after the main one

* To determine the position of a string in the ASCII table, call the `ord` method

```
'a'.ord #=> 97
'b'.ord #=> 98

'a' <=> 'b' #=> -1
```

* To sort in descending order:
```
[2, 5, 7, 1, 9].sort do |a, b|
  b <=> a
end
```

* `String#<=>` compares multi-character strings character by character, so strings beginning with `a` will come before strings beginning with `b`. If the first character is the same in both words then the second character is compared and so on.

* If the strings are of different lengths, and the strings are equal when compared up to the shortest length, then the longer string is considered greater than the shorter one.

* `Array#<=>` compares each object in the array in an element-wise manner

* This means if `Array#<=>` is called on a nested array, the first element in each nested array will be compared first.

* In this example:
```
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
```
Calling `sort` directly on the nested array `['b', 2]` would result in an error because they aren't the same object type. However, because the comparison is performed on an element by element basis, the second element of the array isn't subjected to `<=>`.

There is another sub-array which contains an integer ['a', 'car', 'd', 3]. In this case the integer does come into play, but only in terms of comparing the length of this array with the array ['a', 'car', 'd']. The integer itself is not compared with a string, so again no error is thrown.

* `sort_by` method is usually called with a block:
```
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
```

* `sort_by` can be called on hashes
  - pass two arguments into the block - k, v
  - will return an array even when called on a hash
  - if sorting by keys and the keys are symbols, `to_s` will be called in the background

## Nested data structures
```
a = [1, 3]
b = [2]
arr = [a, b]
arr => [[1, 3], [2]]
```
* In the code above the local variable `a` has been initialised and an Array object has been assigned to it. The Array object contains two elements, the integers `1` and `3`. The local variable `b` has been initialised and an Array object has been assigned to it. The Array object contains one element, the integer `2`. The local variable `arr` has been initialised and an Array object has been assigned to it. The Array object contains two elements. The first element is the Array object referenced by local variable `a` and the second element is the Array object referenced by local variable `b`. The Array object referenced by local variable `arr` is a nested array. `arr[0]` and `a` both point to the same Array object. `arr[1]` and `b` both point to the same Array object. 

## Creating shallow copies of collections
* A collection can be copied if you want to save the original before performing major modifications on a collection.

* The methods `dup` and `clone` create a shallow copy of the calling object. **If the calling object contains other objects i.e. a nested array, then those objects will be *shared*, not copied**.

* This has important consequences. If you call a destructive method on an object within a `dup` or `clone` copied object then the original object will be modified

* Consider these examples:
EXAMPLE 1.
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```
The destructive method `map!` has been called on the `arr2` object. Since we are changing the Array, not the elements within it, arr1 is left unchanged.

EXAMPLE 2.
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```
The destructive method `#upcase!` has been called on each element *within* the Array `arr2`. The elements within `arr2` is a reference to the object referenced by the corresponding element in `arr1`. Thus, when `#upcase!` mutates the element in `arr2`, `arr1` is also affected; we change the Array elements, not the Array.

## Freezing objects
* `clone` preserves the state of a frozen calling object; `dup` does not
```
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
```
```
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

* Only mutable objects can be frozen because immutable objects, like integers, are already frozen.

* To check if an object is frozen use `frozen?` method

* `freeze` only freezes the calling object. If the calling object contains other objects, those objects won't be frozen:
```
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```
