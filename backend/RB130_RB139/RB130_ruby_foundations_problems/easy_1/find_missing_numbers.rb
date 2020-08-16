# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# PEDAC
# Algorithm
# Use the min and max values from the input array to create a range
# Iterate over the range and determine if current element is included in input array
# If true, next
# If false, add element to return array
# Return new array
#
# START
# missing_num = empty array
# min_val = minimum value from input array
# max_val = maximum value from input array
# val_range = range from `min_val` to `max_val` converted into array
#
# UNTIL iterated through all values in `val_range`
#   check if current `val_range` element is included in `input_arr`
#   if true
#     next
#   if false
#     add element to `missing_num`
#   end
# END
#
# return `missing_num`

def missing(arr)
  missing_num = []
  min_val = arr.min
  max_val = arr.max
  val_range = (min_val..max_val).to_a

  val_range.each do |num|
    if arr.include?(num)
      next
    else
      missing_num << num
    end
  end

  missing_num
end

puts missing([-3, -2, 1, 5])== [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
