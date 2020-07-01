# Nested data structures

When working with nested data structures (such as nested arrays) it's really important to know if you're performing an operation on the inner arrays or the objects within each array.

## Variable reference for nested collection

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```

The local variables `a and b` have been placed as elements within the variable `arr` . If a change is made to `a` , `arr` will be modified too because `a` still points to the same object that's in `arr` .

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```

## Shallow copy of collections

A situation where you can easily get caught out is if you create a copy of a collection so you can preserve the original collection and make major modifications to the copy. You have to consider - are you making changes to the collection or the objects within the collection?

Ruby has two methods for copying objects, including copying collections - `dup` and `clone`. These objects create a **shallow copy** of an object. Only the object that the method is called on is copied. If the object contains other objects i.e. a nested array, then those objects are *shared*, not copied. This has consequences for nested collections. 

`dup` and `clone` both allow objects within the copied object to be modified:  

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"] 
```

```ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```

Note that with both methods the objects within the original objects have been modified when an action was performed on the copied arrays. This is because the `upcase!` and `reverse!` methods are destructive and were called on the object **within** the array - not the array itself. 

Consider these examples:

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```

In the first example the destructive method `map!` was called on `arr2`. Because `map` modifies the Array, replacing each element within `arr2` with a **new** value, `arr1` is unchanged.

In example 2 `each` has been used to call the destructive method `upcase!` on each element **within** `arr2` so `arr1` is also affected. This is because each element of `arr2` is a reference to the object referenced by the corresponding element in `arr1`. 

## Freezing objects

The main difference between `dup` and `clone` is that `clone` preserves the frozen state of an object but `dup` doesn't.

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
```

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

`freeze` can be used to prevent mutable objects from being modified. Immutable objects like integers are already frozen. You can check by using the `frozen?` method, which returns a boolean value.

Again, you need to be careful if you call `freeze` on a nested array. If the object `freeze` is called on contains objects, the inner objects won't be frozen i.e. if you call `freeze` on a nested array then the nested objects can still be modified. 

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```