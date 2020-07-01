# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it is not
# You may not use the Array#include? method in your solution.
#
# INPUT
# array of integers and a search value (integer)
#
# OUTPUT
# true or false
#
# RULES
# if the array contains the search term, return true. If it doesn't return false
#
# ALGORITHM
# iterate over the array 
# if an element is the same as the search term return true
# if no elements match the search term return false

def include?(array, search_term)
  array.count(search_term) > 1 ? true : false
end
