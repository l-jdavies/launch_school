# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
# Note: If the number is a multiple of both 3 and 5, only count it once.

# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# don't include input integer in the range
# if number is multiple of both 3 and 5, only count once
#
# ALGORITHM
# create a range of integers from 1 to `input_int` (don't include `input_int`)
# initialise an array ('multiple_arr')
# iterate over integers
#   if integer is a multiple of 3 or 5 add to `multiple_arr`
# return sum of `multiple_arr`

def solution(number)
  multiple_arr = []

  (1...number).each do |num|
    multiple_arr << num if num % 3 == 0 || num % 5 == 0
  end
  multiple_arr.sum
end
