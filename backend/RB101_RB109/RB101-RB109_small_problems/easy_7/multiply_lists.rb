# Write a method that takes two Array arguments in which each Array contains a list of numbers, 
#  and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. 
#  You may assume that the arguments contain the same number of elements.
#
# INPUT
# two arrays
# OUTPUT
# new array containing the sum of each array at each index
# RULES
# both arrays contain same number of elements

def multiply_lists(array1, array2)
  new_array = []
  
  index = 0

  until index >= array1.size
    new_array << (array1[index] * array2[index])
    index += 1
  end
  new_array
end

# using Array#zip

def multiply_list(array1, array2)
  array1.zip(array2).map {|arr| arr.reduce(:*) }
end
