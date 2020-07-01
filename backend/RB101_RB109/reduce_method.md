# #reduce or #inject

The `reduce` or `inject` (interchangeable names) is a `Enumerable` method. It is most useful when working with collections and it reduces/accumulates/compresses a collection of values (string or integer) into a single value. 

The method takes a block as an argument (there are many variations on this but for now, I'll just stick with using a block). The block has two variables ⇒ memory and the value. The memory can be added to as you iterate over a collection and the value is the current element in the iteration. 

`reduce` will always return a single data object - `memo`, unless otherwise specified. Specifying an argument is optional. If you don't specify an argument then `memo` will be assigned the first element in the collection. If you do specify an argument then `memo` will be assigned that value. 

```ruby
[1, 2, 3, 4, 5].reduce { |memo, num| memo += num }

=> 15

# This is what's happening with each iteration:
	# first iteration
	#	memo = 1
	# num = 2
	# memo returns 3

	# second iteration
	# memo = 3
	# num = 3
	# memo returns 6

# and so on until 15 is returned 
```

If we specify an argument:

```ruby
[1, 2, 3, 4, 5].reduce(10) { |memo, num| memo += num }

=> 25

# In the first iteration memo = 10 and num = 1

```

A shorthand for  the above method is:

```ruby
[1, 2, 3, 4, 5].reduce(10, &:+)
```

## Using `reduce` to find the longest string

```ruby
sentences = ["The ice cream truck is rolling on by", "There is a dog in the park", "There are jumping lizards on the fountain", "Why is there no rain today? I brought an umbrella for nothing.", "There is a dog park nearby!"]

sentences.reduce { |memo, string| memo.length > string.length ? memo : string }

# => Why is there no rain today? I brought an umbrella for nothing.
```

## Using `reduce` to print a vowel in a string multiple times

If the string contains a vowel then we want the vowel to be printed 5 times.

```ruby
sentence = "Allo allo what's going on here then?"

sentence.chars.reduce('') { |memo, char| %w(a e i o u A E I O U).include?(char) ? memo + char * 5 : memo + char }

# => AAAAAllooooo aaaaallooooo whaaaaat's goooooiiiiing ooooon heeeeereeeee theeeeen?
```

I initialized `reduce` with an empty string because if I hadn't 'A' would be assigned to memo and only `char` is examined to see if it's a vowel. By initializing with an empty string it means 'A' is assigned to `char` in the first iteration. 

## Use `reduce` to see which number appears most in an array

```ruby
numbers = [1, 4, 2, 4, 1, 2, 5, 5, 2, 2, 1, 5, 5, 2, 3, 5, 5, 1]

numbers.reduce { |memo, num| numbers.count(memo) > numbers.count(num) ? memo : num }

# => 5
```