## Regex
* To search for patterns can use the matching operatir `=~`
```
"powerball" =~ /b/
=> 5
```
* Returns the index of the first match
* Because `5` is a truthy value it can be used as a boolean
```
def has_a_b?(string)
  if string =~ /b/
    puts "We have a match"
  else
    puts "No match here"
  end
end

has_a_b?("basketball")
=> We have a match

has_a_b?("golf")
=> No match here
```
* Could also use the `match` method. This returns a `MatchData` object that describes the match or `nil`.
```
/b/.match("powerball")
=> #<MatchData "b">
```
* The `MatchData` object can be used as a boolean value
```
def has_a_b?(string)
  if /b/.match(string)
    puts "We have a match"
  else
    puts "No match"
  end
end

has_a_b?("basketball")
=> We have a match

has_a_b?("golf")
=> No match
```

## Blocks and Procs
* Blocks can be passed to a method, just like a normal variable
```
def take_block(&block)
  block.call
end

take_block do
  puts "This block is being called in the method"
end
```
* The ampersand `&` in the method definition states that the argument is a block
* The block must be the last parameter in the method definition
* You can also pass an argument as well as a block to a method
```
def take_block(number, &block)
  block.call(number)
end

number_variable = 42
take_block(number_variable) do |num| 
  puts "This block is being called in the method, along with number #{num}"
end
```

![image](https://github.com/l-jdavies/images/blob/master/block_as_parameter.jpg)
