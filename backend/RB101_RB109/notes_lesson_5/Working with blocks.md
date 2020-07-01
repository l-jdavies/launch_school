# Working with blocks

What's happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

[Description of code](https://www.notion.so/b5a7abdaac2e4435990e277515b218b6)

Another example:

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

[Description of code](https://www.notion.so/8375fb70fd5b4b1f961ce3baddce2ca6)

Example 6:

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

[Description of code](https://www.notion.so/8712a040e3a343bca3af78ebd955d29f)

Describe what's happening in this code block:

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

`Array#select` has been called on an array of hashes and a block has been passed into `select` as an argument. Within the block the parameter `hash` has been specified. Each hash within the initial array will be assigned to the block variable `hash`. `Array#all?` has been called on `hash` with another block passed in as an argument. The inner block has two parameters, `key and value` . Within the inner block an equality comparison is performed. If the string assigned to the block variable `value` at index 0 is the same value as the block variable `key` converted to a string, then `true` will be returned. Any hash that returns `true` from the `all?` method will be passed to the `select` method. The code will return all objects that return `true` from the `select` method, which returns any objects that return `true` from the inner block. Therefore, this code will return `{ c: 'cat' }`. 

Describe what's happening here:

```ruby
[[[1], [2], [3], [4]], [[1], [2], [3], [4]]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

The array is composed of `[[1], [2], [3], [4]]` and `[[1], [2], [3], [4]]`. `Array#map` has been called on a triple nested array and a block has been passed into `map` as an argument. Within the block, the block variable `element1` has been initialized. The nested arrays `[[1], [2], [3], [4]]` and `[['a'], ['b'], ['c']]` will each be assigned to `element1` . `map` will return a new array contained the objects returned by the outer block. `Array#each` has been called on the block variable `element1` and a second block has been passed in as an argument, with the block variable `element2` initialized. `each` will return the object it was called on. On the first iteration of this code, `[[1], [2], [3], [4]]` will be assigned to `element1` and during the first iteration of `element1.each` `[1]` will be assigned to `element2` . `partition` has been called on `element2` with a block as an argument. The method `partition` returns two arrays - one array containing objects that evaluate to true and another array containing objects that evaluate to false. Because `each` returns the object it was called on and `partition` does not destructively modify any objects it is called on, the return value from `partition` is not going to affect the return value of `each`. This means the return value from the `each` block will be the object it was called on - each of the sub-array's, and that's what will get passed to `map`. Therefore this code block will return a new array that contains the same values as the initial triple nested array.

Describe what's happening here:

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end 
```

The nested array is composed of `[[1, 2], [3, 4]]` and `[5, 6]`. `Array#map` has been called on the nested array and a block has been passed into `map` as an argument. `map` will be return a new array containing the objects returned by the block. The `map` block has initialized the block variable `arr` upon which `map` has been called. The inner `map` also has a block passed in as an argument. The inner `map` block has initialized the block variable `el` and the first block of the inner block has an `if` statement to impose conditional flow. The first line of the `if` statement is an equality comparison. If the block variable `el` , when converted from an integer to a string, has a size that is equal to `1` then `el` will be incremented by `1` . If the equality comparison evaluates to false then `map` will be called on `el` and 1 will be added to each element with the sub-array.

For example on the first iteration of this code `arr` will be evaluated as `[[1, 2], [3, 4]]` . `map` will be called on `[[1, 2], [3, 4]]` an the block variable `el` will be evaluated as `[1, 2]` . The  equality operation in the `if` statement will evaluate to false so `map` will be called on `el` . The return value of `el.map` will be `[2, 3]` . Another iteration of `arr.map` will be performed with `el`  evaluated as `[3, 4]` . The return value of `el.map` on the second iteration will be `[4, 5]`. This means the return value from the first iteration of the top `map` is `[[2, 3], [4, 5]]`. On the second iteration of the top `map` `arr` will be evaluated as `[5, 6]` and `el` will be evaluated as `5`. The equality comparison in the `if` statement will evaluate to true so `6` will be returned from the first iteration of `arr.map` and `7` will be returned from the second iteration of `arr.map`. The final returned array from the code will be `[[[2, 3], [4, 5]],[6,7]]`