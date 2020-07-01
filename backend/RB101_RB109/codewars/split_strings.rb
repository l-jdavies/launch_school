# Complete the solution so that it splits the string into pairs of two characters.
# If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').
#
# INPUT
# string
#
# OUTPUT
# array of character pairs
#
# ALGORITHM
# START
# SET new_arr = array of string pairs
#
# split str into array of characters
# UNTIL the array is empty
#   shift the first two elements of the array into the `new_arr`
#   IF the length of the `input_str` is odd
#     add a '_' to the last element of `new_arr`
#
# flatten `new_arr` and return
# END

def solution(str)
  new_arr = []

  characters = str.chars

  until characters.empty?
    new_arr << characters.shift(2).join('')
  end

  new_arr[-1] << '_' if str.length.odd?
  new_arr
end
