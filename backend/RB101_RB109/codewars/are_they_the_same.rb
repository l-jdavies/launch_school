# Given two arrays a and b write a function comp(a, b) (compSame(a, b) in Clojure) that checks whether the two arrays have the "same" elements, with the same multiplicities
# "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
#
# INPUT
# two arrays of integers
#
# OUTPUT
# boolean
#
# RULES
# determine if for each element in `array2`, it's equal to the square of an integer in `array2`
#
# ALGORITHM
# SET array1_sq = store square of each integer in `array1`
#
# iterate over each element in `array2`
#   IF `array1_sq` does not include the current element, return false
# end
#
# return true 
# END

def comp(array1, array2)
  return false if array1.empty? || array2.empty?

  array1_sq = []

  array1.each do |num|
    array1_sq << (num ** 2)
  end

  array2.each do |num|
    return false if array1_sq.include?(num) == false
  end
  true
end
