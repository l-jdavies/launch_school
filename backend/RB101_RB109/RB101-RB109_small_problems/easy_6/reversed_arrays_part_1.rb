# Write a method that takes an Array as an argument, and reverses its elements in place
# that is, mutate the Array passed into this method.
# The return value should be the same Array object.
# You may not use `Array#reverse` or `Array#reverse!`
#
# INPUT
# an array 
# could be string or integers
#
# OUTPUT
# return the original array in reverse order
#
# RULES
# returned array must have same object id as argument
# returned array isn't necessarily descending order - just opposite order to input
#
# ALGORITHM
# within the original array re-assign the object in index 0 with the object at the last index position
# repeat the process until all objects within the array are in reverse order
# stop when half way through the array
# can be determined by the last_index value => will be half the array.size
#
# START
# SET first_index = 0
# SET last_index = -1
# 
# UNTIL last_index == -(array.size / 2) => break at end of loop
# array[first_index], array[last_index] = array[last_index], array[first_index]
# first_index += 1
# last_index -= 1
#
# array
# END

def reverse!(array)
  first_index = 0
  last_index = -1

  loop do
    array[first_index], array[last_index] = array[last_index], array[first_index]

    first_index += 1
    last_index -= 1

    break if last_index < -(array.size / 2)
  end
  array
end

