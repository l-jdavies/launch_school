# Write a method that takes an Array of numbers and then returns the sum of the sums
# of each leading subsequence for that Array. 
# You may assume that the Array always contains at least one number.

# INPUT
# array of integer/s
#
# OUTPUT
# integer
#
# RULES
# return the sum of the sums for each leading sequence for the Array
#
# ALGORITHM
# START
# SET sum = 0
# SET current = 0
# 
# array.each do |num|
#   current += num
#   sum += current
# end
#
# sum
# END

def sum_of_sums(array)
  current = 0
  sum = 0

  array.each do |num|
    current += num
    sum += current
  end

  sum
end
