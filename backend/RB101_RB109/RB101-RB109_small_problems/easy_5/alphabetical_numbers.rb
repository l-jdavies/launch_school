# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers sorted based on the English words for each number:
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
#
# INPUT
# array of integers
#
# OUTPUT
# array of integers sorted based on order of alphabetical name
#
# ALGORITHM
# iterate over the initial array
# associate the Engligh word for each number
# save the English words in a new array
# sort the word array alphabetically
# associate each word with the integer
# return new array with the integers in same order as word array
#
# START
#
# SET word_array = []
# SET word_integer_hash => create hash with integer as key and English word as value
# iterate over initial array and save hash value in new 'word_array'
# word_array.sort
# iterate over word_array
# for each hash value, add the key to return array
# return_array << hash.key(value)
# return the return_array
#
# END

def alphabetic_number_sort(array)

  word_array = []

  word_integer_hash = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  array.each do |integer|
    word_array << word_integer_hash[integer]
  end

  word_array.sort!

  final_array = []

  word_array.each do |word|
    final_array << word_integer_hash.key(word)
  end
  final_array
end
  
