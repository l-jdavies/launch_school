# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described.
# Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.
#
# INPUT
# an array
#
# OUTPUT
# same array object by sorted
#
# RULES
# iterate over the array and compare in a pairwise manner
# if ele1 > ele2 then swap the elements in the array
# continue iterating through the array until no more swap occur
# return sorted array
#
# ALGORITHM
# START
# SET current = start at 0, set by current index position
# SET next = start at 1, set by index position + 1
# SET swap = initialize as false, use as a flag during iteration
# 
# UNTIL swap is still false after the array has been iterated over
# SET swap = false
#   iterate over array by object and index |element, idx|
#     current = assign `element`
#     next = assign to next element in `input_array`
#     IF current > next
#       reassign `current` to `next` and `next` to `current`
#       swap = reassign to true
#     END
#
# return `input_array`
def bubble_sort!(arr)
  loop do
    swap = false

    1.upto(arr.size - 1) do |index|
      next if arr[index - 1] <= arr[index]
      arr[index - 1], arr[index] = arr[index], arr[index - 1]
      swap = true
    end
    
    break if swap == false 
  end
  arr
end

