# Write a method that combines two Arrays passed in as arguments and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation
# You may assume that both input Arrays are non-empty and that they have the same number of elements
#
# INPUT
# two arrays
# 
# OUTPUT
# single array
#
# RULES
# return single array containing all elements from both input arrays
# take an element from each array in alternation
# 
# ALGORITHM
# create new array
# add element from arr1 into new array
# add element from arr2 into new array
# repeat until all elements from input arrays are present in new array
#
# START
# SET inter_arr = []
# SET idx = 0
#
# UNTIL idx == length of second input array
# inter_arr << element from arr1 at idx position
# inter_arr << element from arr2 at idx position
#
# increment idx by 1
#
# RETURN inter_arr

def interleave(arr1, arr2)
  inter_arr = []
  idx = 0

  loop do
    inter_arr << arr1[idx]
    inter_arr << arr2[idx]
    
    idx += 1
    break if idx >= arr2.length
  end
  inter_arr
end
