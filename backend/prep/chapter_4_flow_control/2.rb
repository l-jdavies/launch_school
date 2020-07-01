# Write a method that takes a string as argument. 
# # The method should return a new, all-caps version of the string, 
# # only if the string is longer than 10 characters. 
# # Example: change "hello world" to "HELLO WORLD". 

def response_length(words)
  if words.length > 10
    puts words.swapcase
  elsif
    puts "OK, thanks"
  end
end


response_length("hello my name is billy bob")
