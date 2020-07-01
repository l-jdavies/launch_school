# Complete the function that:
# accepts two integer arrays of equal length
# compares the value each member in one array to the corresponding member in the other
# squares the absolute value difference between those two values
# and returns the average of those squared absolute value difference between each member pair.
#
# INPUT
# two arrays
#
# OUTPUT
# single integer
#
# RULES
# both arrays will be equal length
# at each index position, determine the difference between the value in arr1 and arr2
# square the difference
# sum the squared differences
# return the average
#
# ALGORITHM
# START
# SET arr_sqs = save squared values
#
# iterate over arr1 with index |element, idx|
#   SET difference = save value
#   difference = element in arr1 - element in arr2
#   save difference squared to `arr_sqs`
# end
#
# divide the sum of `arr_sqs` by the length of arr1
# END

def solution(arr1, arr2)
  arr_sqs = []

  arr1.each_with_index do |num, idx|
    difference = num - arr2[idx]
    arr_sqs << difference ** 2
  end
  arr_sqs.sum.to_f / arr1.length
end
