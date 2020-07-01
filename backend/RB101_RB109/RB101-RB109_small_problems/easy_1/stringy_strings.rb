# Write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.
#
# INPUTS
# - positive integer
#
# OUTPUTS
# - string containing alternating '1' and '0'
# - string length is the input integer
#
# RULES
# - output is a string
# - string should start with 1
# - length of string matches the integer
#
# DATA STRUCTURE
# - input is integer
# - create an array in which '1' and '0' are added 
# until length of array == integer
# - join the array to create a string
#
# EXAMPLES
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
#
# ALGORITHM
# - for the number of times specified by the integer
# - determine if integer is even
# - #times method starts at zero
# - zero.even? == true
# - if true add '1' to the array
# - if false add '0' to the array
# - join array to return string
####################################

def string_of_ones_and_zeros(integer)
  array = []
  integer.times do |element|
    if element.even?
      array << '1'
    else
      array << '0'
    end
  end
  array.join
end



