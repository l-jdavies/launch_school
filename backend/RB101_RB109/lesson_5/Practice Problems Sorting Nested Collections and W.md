# Practice Problems: Sorting, Nested Collections and Working with Blocks

**Practice Problem 1**

How would you order this array of number strings by descending numeric value?

```ruby
arr = ['10', '11', '9', '7', '8']
```

```ruby
arr.map(&:to_i).sort { |a, b| b <=> a }
```

**Practice Problem 2**

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

```ruby
books.sort_by { |book| book[:published] }
```

The year doesn't need to be converted to an integer because all the strings have the same character length so the comparison can be performed on the strings directly.

**Practice Problem 3**

For each of these collection objects demonstrate how you would reference the letter `'g'`.

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
```

```ruby
arr1[2][1][3]

arr2[1][:third][0]

arr3[2][:third][0][0]

hsh1['b'][1]

hsh2[:third].keys
```

**Practice Problem 4**

For each of these collection objects where the value `3` occurs, demonstrate how you would change this to `4`.

```ruby
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
```

```ruby
arr1[1][1] = 4

arr2[2] = 4

hsh1[:first][2] = [4]

hsh2[['a']][:a][2] = 4
```

**Practice Problem 5**

Given this nested Hash:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

figure out the total age of just the male members of the family.

```ruby
male_ages = 0

munsters.each_value do |person|
	male_ages += person["age"] if person["gender"] == 'male'
end
```

**Practice Problem 6**

One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

..like this:

```ruby
(Name) is a (age)-year-old (male or female).
```

```ruby
munsters.each do |key, value|
	puts "#{key} is a #{value["age"]}-year-old (#{value["gender"]})"
end
```

**Practice Problem 7**

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

`arr` will be a nested array `[2, [5, 8]`.  `arr[0] += 2` will re-assign the object at index 0 of `arr` but it will not affect `a` . `arr[1][0] -= a`  however, will affect `b` because both `b` and `arr` both reference the same Array object, so modifying objects within the Array will change the object referenced by both `arr` and `b` . That's an important difference between individual objects and nested objects. `b` references the Array, not the objects contained in the Array. `a` will still have a value of `2` and `b` will reference `[3, 8]` .

**Practice Problem 8**

Using the `each` method, write some code to output all of the vowels from the strings.

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

```ruby
hsh.values.each do |subarr|
	subarr.each do |string|
		string.chars.each do |character|
			puts character if %w(a e i o u A E I O U).include?(character)
		end
	end
end
```

**Practice Problem 9**

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

```ruby
arr.map do |subarr|
	subarr.sort! { |a, b| b <=> a }
end
```

**Practice Problem 10**

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
	new_hash = {}
	hash.each do |key, value|
		new_hash[key] = value + 1
	end
new_hash
end
```

**Practice Problem 11**

Given the following data structure use a combination of methods, including either the `select` or `reject` method, to return a new array identical in structure to the original but containing only the integers that are multiples of `3`.

```ruby
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

```ruby
arr.map do |subarr|
	subarr.select do |integer|
		integer if integer % 3 == 0
	end
end
```

**Practice Problem 12**

Given the following data structure, and without using the `Array#to_h` method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

```ruby
hash = {}

arr.each do |subarr|
 hash[subarr[0]] = subarr[1]
end

hash
```

**Practice Problem 13**

Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

```ruby
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#=> [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

```ruby
arr.sort_by do |subarr|
	subarr.select do |integer|
		integer.odd?
	end
end
```

**Practice Problem 14**

Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

```ruby
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```

```ruby
hsh.values.map do |details|
	if details[:type] == 'fruit'
		details[:colors].map do |colour|
			colour.capitalize
		end
	elsif details[:type] == 'vegetable'
		details[:size].upcase
	end
end
```

**Practice Problem 15**

Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

```ruby
arr.select do |hash|
	hash.all? do |key, value|
		value.all? do |num|
			num.even?
		end
	end
end
```