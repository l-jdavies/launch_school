## Modifying arrays

* Permanently remove the last item on an array with the `pop` method.
```
irb(main):001:0> array = [1, 2, 56, 8547, "bob"]
=> [1, 2, 56, 8547, "bob"]                                                                                                                                                    
irb(main):003:0> array.pop
=> "bob"
irb(main):004:0> array
=> [1, 2, 56, 8547]
```
* `pop` mutates the caller and returns the item removed.

* To add an item to an array, use `push`
* `push` also mutates the caller
```
irb(main):001:0> array = [1, 2, 56, 8547, "bob"]
=> [1, 2, 56, 8547, "bob"]
irb(main):002:0> array.push("add me")
=> [1, 2, 56, 8547, "bob", "add me"]
```
* Same thing can be achieved with the shovel operator.
```
array << "add me"
```

* `delete_at` eliminates a value at a certain index in the array
* `delete_at` is a destructive method
* It returns the removed value 
```
array.delete_at(1)
=> 2
```

* To remove a value without the index, use `delete` (destructive)
* Also returns the removed value
```
array.delete("bob")
=> "bob"
```

* `uniq` iterates through and array, deletes any duplicate values and returns to results as a new array
* The original array is **not** modified
```
irb :010 > b = [1, 1, 2, 2, 3, 3, 4, 4]
=> [1, 1, 2, 2, 3, 3, 4, 4]
irb :011 > b.uniq
=> [1, 2, 3, 4]
irb :012 > b
=> [1, 1, 2, 2, 3, 3, 4, 4]
```
* Can add bang suffix (!) to perform the `uniq` function destructively 
* Note: you can't just add `!` to any method to cause it to function destructively - also check the docs.

## Nested arrays
* Can create arrays within arrays
```
irb :001 > teams = [['Joe', 'Steve'], ['Frank', 'Molly'], ['Dan', 'Sara']]
=> [["Joe", "Steve"], ["Frank", "Molly"], ["Dan", "Sara"]]
```
* Then access the arrays by index
```
irb :002 > teams[1]
=> ["Frank", "Molly"]
```

## Comparing arrays
* Arrays can be compared with the equality operator
```
irb :001 > a = [1, 2, 3]
=> [1, 2, 3]
irb :002 > b = [2, 3, 4]
=> [2, 3, 4]
irb :003 > a == b
=> false
```

## to_s
* If you use string interpolation on an array, Ruby will call the `to_s` method on integers in the background.
```
irb :001 > a = [1, 2, 3]
=> [1, 2, 3]
irb :002 > "It's as easy as #{a}"
=> "It's as easy as [1, 2, 3]"
```
## Common array methods
* `include?` check if the arguement provided is included in the array
```
irb: 001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb: 002 > a.include?(3)
=> true
irb: 003 > a.include?(6)
=> false
```

* `flatten` takes an array containing nested arrays and returns a one-dimensional array - not destructive
```
irb: 001 > a = [1, 2, [3, 4, 5], [6, 7]]
=> [1, 2, [3, 4, 5], [6, 7]]
irb: 002 > a.flatten
=> [1, 2, 3, 4, 5, 6, 7]
```
* `each_index` iterates through an array, the variable represents the index number, rather than the value at each index. Passes the index of the element to the block and returns the original array.
```
irb: 001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb: 002 > a.each_index { |i| puts "This is index #{i}" }
This is index 0
This is index 1
This is index 2
This is index 3
This is index 4
=> [1, 2, 3, 4, 5]
```
* `each_with_index` can be used to manipulate both the value and the index.
```
irb: 001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb: 002 > a.each_with_index { |val, idx| puts "#{idx+1}. #{val}" }
1. 1
2. 2
3. 3
4. 4
5. 5
=> [1, 2, 3, 4, 5]
```

* `sort` returns a sorted array but is not destructive
```
irb :001 > a = [5, 3, 8, 2, 4, 1]
=> [5, 3, 8, 2, 4, 1]
irb :002 > a.sort
=> [1, 2, 3, 4, 5, 8]
```

* `product` combines two arrays in each possible combination
```
irb :001 > [1, 2, 3].product([4, 5])
=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
```
## Map vs each

* `each` iterates over each element in an array and returns the original array
* `map` also iterates through each element in an array but returns a new array containing the values returned by the block
* Note that although `map` returns a new array, the method is non-destructive and the original array is unchanged.
