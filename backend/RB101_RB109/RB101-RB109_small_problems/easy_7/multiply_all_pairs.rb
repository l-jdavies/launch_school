# Write a method that takes two Array arguments in which each Array contains a list of numbers
# and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.
#
# INPUT
# two arrays of integers
# OUTPUT
# one array of integers
# RULES
# calculate the product of every pair of numbers formed between the two array
# sort return array in ascending order
#
# ALGORITHM
# iterate over first array
# iterate over second array
# multiply each element from array 1 by each element in array2
# add the result of the multiplications to a new array
# sort new array in ascending order
# return new array
#
# START
# SET multiples = []
#
# array1.each do |num1|
#   array2.each do |num2|
#     multiples << num1 * num2
#   end
# end
#
# multiples.sort
# END

def multiply_all_pairs(array1, array2)
  multiples = []

  array1.each do |num1|
   array2.each do |num2|
     multiples << num1 * num2
    end
  end

multiples.sort
end
