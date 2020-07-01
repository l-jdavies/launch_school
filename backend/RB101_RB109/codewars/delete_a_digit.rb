# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# 
# ALGORITHM
# initialise an array
# delete a digit in each index position of the input integer and add to array
# return max value from the array

def delete_digit(n)
  arr = []

  idx = 0
  loop do
    num = n.clone.to_s.chars
    num.delete_at(idx)
    arr << num.join('').to_i
    idx += 1
    break if idx == n.digits.length
  end
  arr.max
end
