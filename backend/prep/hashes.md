## What is a hash?
* Data structures that store items by associated keys (unlike arrays - stores by ordered index)
* Hash created with symbols as keys and data types as values
```
my_hash = {
  name: 'Laura',
  hair: 'brown'
  }
```

* To add an additional entry into a hash, state the key as a symbol (`:cat`, not `cat:`)
```
my_hash[:pet] = 'dog'
```
* To delete an element, use the symbol and note bracket type
```
my_hash.delete(:hair)
```
* To retrive information
```
my_hash[:pet]
=> 'dog'
```
* You can also merge hashes together
```
first_hash.merge!(second_hash)
```
* The bang suffix means the `first_hash` has been mutated

## Iterating over hashes
* Can use the `each` method and pass both the key and the value to the block
```
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, val|
  puts "Bob's #{key} is #{val}!"
end
```
## Hashes as optional parameters
* It's possible to write a method in which the hash is empty and the key/value data can be passed to the method as an argument.
```
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
          " years old and I live in #{options[:city]}."
    end
end

greeting("Bob")
greeting("Bob", age: 62, city: "New York City")
```

## Common hash methods
* `has_key?` checks if a hash contains a specific key. Returns boolean value.
```
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}

name_and_age.has_key?("Joe")
=> True

name_and_age.has_key?("Billy-Bob")
=> False
```
* `select` allows you to pass a block to the method and will return key-value pairs that evaluate to `true`
```
name_and_age.select { |key, value| key == "Bob" }
=> {"Bob"=>42}

name_and_age.select { |key, value| (key == "Bob") || (value == 31) }
=> {"Bob"=>42, "Steve"=>31}
```
* `fetch` method allows you to pass a key and it will return the value of the key
```
name_and_age.fetch("Steve")
=> 31
```
* Can also specify what you want returned if a key isn't present in a hash
```
name_and_age.fetch("Joleen", "Try again")
```
* `to_a` returns an array - the original hash is unmodified
```
name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
```
* `keys` or `values`will retrieve all keys or values from a hash in an array
```
name_and_age.keys
=> ["Bob", "Steve", "Joe"]

name_and_age.values
=> [42, 31, 19]
```
