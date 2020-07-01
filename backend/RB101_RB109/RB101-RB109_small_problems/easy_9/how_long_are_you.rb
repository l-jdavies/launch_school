# Write a method that takes a string as an argument, and returns an Array that contains every word from the string,
# to which you have appended a space and the word length.
#
# INPUT
# strings
#
# OUTPUT
# array of strings
#
# RULES
# return array containing initial string values with integer appended
# 
# ALGORITHM
# split the string into an array of strings
# iterate over the array of strings and count how many characters in each string
# add each word to an array with the number of characters included in string
# return array

# SET word_arr = []
# 
# SET split_str = str.split
# split_str.each do |word|
# num = word.length.to_s
# word_arr << word + num
# END

def word_lengths(str)
  word_arr = []

  split_str = str.split

  split_str.each do |word|
    num = word.length.to_s
    word_arr << word + " " + num
  end

  word_arr
end
