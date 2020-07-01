# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers.
#
# INPUTS
# - array of integers
#
# OUTPUTS
# - integer
# - average of all integers in the array
#
# RULES
# - array will never be empty
# - numbers will always be positive
# - return average of all integers in the array
# - to calculate the average the sum of all integers in the array
# should be divided by the array length
#
# DATA STRUCTURE
# - input will be an array
# - output will be an integer
#
# EXAMPLES
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
#
# ALGORITHM
# - Use #sum to calculate the sum of integers in the array
# - divide the sum by the array.length
######################################################

def average_of_array(array)
  (array.sum).to_f / (array.length)
end
