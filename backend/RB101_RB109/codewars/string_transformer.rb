# Given a string, return a new string that has transformed based on the input:
# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input
# Note: You will have to handle multiple spaces, and leading/trailing spaces.
#
# INPUT
# string
#
# OUTPUT
# new string
#
# RULES
# change case of each character
# reverse order of words
# input string will contain alphabet and spaces only
#
# ALGORITHM
# split input string into array of words
# initialize a new str
# starting from -1 index position of input string array, add words to new str
# swap the case of the new string
# 
# START
# SET swap_str = new string object to be returned
#
# SET idx = index position, starting at -1
#
# split `input_str` into array of words
# UNTIL idx equals - `input_str` length
#   add word from `input_str` at index position `idx` to `swap_str`
#   decrement `idx` by 1
# END
#
# swap the case of `input_str` and return
# END

def string_transformer(str)
  swap_case = ''
  
  arr = str.split(/\b/)
  until arr.empty?
    swap_case << arr.pop
  end
  swap_case.swapcase
end
