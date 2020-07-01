# Create a method that takes 2 arguments, an array and a hash
# The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name
# The hash will contain two keys, :title and :occupation, and the appropriate values.
# Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.
#
# INPUT
# array of strings plus a hash
#
# OUTPUT
# output string
#
# RULES
# strings in the array => persons name
# access title and occupation values from hash to output name and job

def greetings(arr, hsh)
  puts "Hello, #{arr.join(' ')}! It's nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end
