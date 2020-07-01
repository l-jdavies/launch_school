# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size
# For instance, the length of "it's" is 3, not 4.

# INPUT
# string contains letters and non-alphabetical characters
#
# OUTPUT
# hash containing word length as key and number of times word length appears as the value
#
# RULES
# don't count non-alphabetical characters
# 
# ALGORITHM
# split the string into words
# iterate over array containing words
# count the number of characters in a word
# don't include non-alphabetical characters in the count
# save the character count in a new array
# iterate over the count array to determine how many times each number appears
# create a hash with the word length as key
# total number of times as value
#
# START
# DELETE non alphbetical characters .gsub(/[^A-Za-z]/, '')
# SET array_of_words = string.split(' ')
#
# iterate over the array #map 
# count number of characters
# save new array as array_of_counts
#
# SET hash = {}
# iterate over array_of_counts #each
# count(num)
# hash[num] = array_of_counts.count(num) if array_of_counts(num) > 1
#
# return hash
# END

def word_sizes(string)
  array_of_words = string.gsub(/[^A-Za-z" "]/, '').split(' ')

  array_of_counts = array_of_words.map { |word| word.size }

  hash = {}

  array_of_counts.each do |num|
    hash[num] = array_of_counts.count(num) if array_of_counts.count(num) > 0
  end
  hash
end

