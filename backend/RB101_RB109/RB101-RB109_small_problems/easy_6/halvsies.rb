# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays)
# that contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements,
# the middle element should be placed in the first half Array.
#
# INPUT
# single array
#
# OUTPUT
# two arrays as a pair of nested arrays
#
# RULES
# first half of original array => first nested array
# second half of original array => second nested array
# if original array contains odd number of objects, middle element should be place in first nested array
#
# ALGORITHM
# initialize an empty nested array
# determine the size of the input array and if the size is an odd number
# if the array is even, divide size by two to move objects into new nested arrays
# if odd, the number of objects moved to the first nested array is half the array size + 1
# return the nested array
#
# START
# SET nested_array = Array.new(2) {Array.new(2)} => returns paired nested array, each contains 2x nil
#
# IF array.size.odd?
#   first_nest = (array.size / 2) + 1
#   second_nest = array.size / 2
#
#   nested_array[0] = array[0, first_nest]
#   nested_array[1] = array[-1, second_nest]
#
# ELSE
#   half = array.size / 2
#
#   nested_array[0] = array[0, half]
#   nested_array[1] = array[-1, half]
# END
#
# nested_array
#
# END

def halvsies(array)
  nested_array = Array.new(2) {Array.new(2)}

  if array.size.odd?
    first_nest = (array.size / 2) + 1

    nested_array[0] = array.shift(first_nest)
    nested_array[1] = array

  else
    half = array.size / 2

    nested_array[0] = array.shift(half)
    nested_array[1] = array
  end
  nested_array
end
#
