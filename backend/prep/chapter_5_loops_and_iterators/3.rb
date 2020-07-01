# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

greetings = ["Hello", "Bonjour", "Hola"]

greetings.each_with_index do | item, index |
  puts "#{index + 1}. #{item}"
end
