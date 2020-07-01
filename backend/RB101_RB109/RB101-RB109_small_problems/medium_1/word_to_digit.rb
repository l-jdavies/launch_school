# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words
#  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# INPUT
# string
#
# OUTPUT
# same string object
#
# RULES
# convert numbers as words into digits
# return mutated input string object
#
# ALGORITHM
# create a hash with the words as keys and digits as values
# split the input string into an array
# iterate over the array
# if a word is included in the hash keys:
#   - substitute the word in the input string for the hash value

WORD_HSH = { 'zero': '0', 'one': '1', 'two': '2', 'three': '3', 'four': '4', 'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9' }

def word_to_digit(str)
  str.split.each do |word|
    if WORD_HSH.keys.include?(word.to_sym)
      str.gsub!(word, WORD_HSH[word.to_sym])
    end
  end
  str
end
