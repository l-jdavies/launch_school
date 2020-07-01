# Sorting

## Spaceship operator

Ruby has has a built in method for sorting arrays - `sort`. Sorting is essential carried out by comparing elements in an array with each other then ordering the elements based on the comparisons.

These comparisons are carried out with the `<=>` operator - the spaceship operator. 

`<=>` performs a comparison of two objects. If the object on the **left** of the operator is **greater** than the object on the **right** then `+1` is returned. If the object on the **right** is **greater** than the object on the **left** then `-1` is returned. If both objects are equal then `0` is returned. The objects both have to be the same type - you can't compare a string with an integer, `nil` will be returned.

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

## How do you know which character is greater?

It's easy to figure out if `2 > 3` or `'d' > 'z'` but what about if `'!' > '?'` ? This is determined by ASCII, American Standard Code for Information Interchange, which encodes characters into integers. The ASCII character order is how `<=>` determines which character comes before another.

You can determine a character's ASCII position by calling `.ord` on the string:

```ruby
b'.ord # => 98
'}'.ord # => 125
```

 Using the `<=>` operator:

```ruby
'b' <=> '}' -1
```

`'}'` is greater than `'b'` therefore `'b'` would come before `'}'` 

Three general rules about ASCII character order:

1. Uppercase letters come before lowercase letters
2. Integers and most (not all) punctuation come before letters
3. There's an extended ASCII table that contains accents and other characters. The extended table comes after the standard table

## Comparing multi-character strings

How would this be sorted?

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```

`String#<=>` compares multi-character strings character by character. Therefore `"ants"` comes before `"arc"`.  `"cap"` comes before `"cape"` because all of the characters are equal but `"cape"` is longer and therefore considered *greater*.

The returned array is:

```ruby
["ants", "arc", "bat", "cap", "cape"]
```

## Sorting nested arrays

How would this be sorted?

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
```

I thought it was the elements within the nested arrays that would be sorted but I was wrong, it's the order of the arrays themselves that are sorted.

`Array#<=>` documentation states **"Arrays are compared in an “element-wise” manner; the first element of ary is compared with the first one of other_ary using the <=> operator, then each of the second elements. If all the elements are equal, then the result is based on a comparison of the array lengths."**

This means the first element from each array is compared `['a'], ['b'], ['a'], ['a']` followed by the second element from each array and so on.

All of the arrays except `['b', 2]` start with `'a'` so the `['b', 2]` array would be moved to the end. 

```ruby
[['a', 'cat', 'b', 'c'], ['a', 'car', 'd', 3], ['a', 'car', 'd'], ['b', 2]]
```

Because the `['b', 2]` array has been sorted based on the first element the `sort` method doesn't throw an error due to comparing a string with an integer. If the first element of that array had been `a` it would have caused an error. 

Comparing the second element of the first three arrays, all of them have `'ca'` as the first two characters but `'r'` comes before `'t'` so the order changes to this:

```ruby
[['a', 'car', 'd', 3], ['a', 'car', 'd'], ['a', 'cat', 'b', 'c'], ['b', 2]]
```

Comparing the third element of the first two arrays, both are `'d'` so `<=>` would return `0` . Moving onto the fourth element, only one array has a fourth element - the integer `3`. If both arrays had a fourth element then comparing a string with an integer would have thrown an error again, however, here the integer serves to make this array `['a', 'car', 'd', 3]` longer and therefore greater than `['a', 'car', 'd']`.

This means the returned array is:

```ruby
 [ ['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
```

## `sort_by` method

`sort_by` is similar to `sort` but it's called with a block. The block determines how the items are compared.

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
```

`word[1]` specifies that each word is sorted by the character at index  `[1]` for each string. Therefore the returned array is `["mat", "bed", "cot"]`.

Hashes aren't usually sorted because the information is retrieved by key-value pairs rather than index position but you can use the `sort_by` method to sort a hash. Both the key and value arguments are passed into the block. 

```ruby
people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do | _, age|
	age
end
```

The last argument in the block should be the value you want the hash sorted by. The returned array would be `[[:Mike, 18], [:john, 25], [:Kate, 27]]` .

If you wanted to sort the above hash by names it is important to remember that uppercase letters are sorted before lowercase letters. Therefore, the names would need to be capitalized in the block:

```ruby
people.sort_by do |name, _|
	name.capitalize
end
=> [[:john, 25], [:Kate, 27], [:Mike, 18]]
```

## Other methods that use comparison

- `min`
- `max`
- `minmax`
- `min_by`
- `max_by`
- `minmax_by`