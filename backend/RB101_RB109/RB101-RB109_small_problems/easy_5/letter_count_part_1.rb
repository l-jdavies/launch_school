# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space
#
# INPUTS
# string
#
# OUTPUTS
# return a hash
#
# RULES
# returned hash has word length as the key and number of words as the value
# non-alphabetic characters are also included in the count
# note: will have to use => syntax because can't use an integer as a symbol
#
# ALGORITHM
# split the string into an array of words
# iterate over array of words and determine the length of the word
# save the length of each word to a new array
# count how many times each number occurs
# save the length as a hash key and the returned count as the value
# return the hash

# PSEUDOCODE
# word_lengths = string.split.map {|word| word.length} 
# for num in 1..word_lengths.max do
#   hash[num] = word_length.count(num) if word_length.count(num) > 0
# end

def word_sizes(string)
  word_lengths = string.split.map {|word| word.length}
  
  return_hash = {}

  max_number = word.lengths.max

  for i in 1..max_number do
    return_hash[i] = word_lengths.count(i) unless word_lengths.count(i) < 1
  end

  return_hash
end

