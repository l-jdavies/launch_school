# INPUT
# array of integers
#
# OUTPUT
# array of integers
#
# RULES
# return an array of integers in which each element is the sum of the previous element
#
# ALGORITHM
# initialise a new array
# iterate over the original array using a loop 
# access each element by index_position
# initialise a variable called sum
# add the initial array element to sum and push sum to the new array
# break loop when index_position > array.size

def running_total(array)
  total_array = []
  index_position = 0
  sum = 0
  
  while index_position < array.size
  sum += array[index_position]
  total_array << sum
  index_position += 1
  end
total_array
end
