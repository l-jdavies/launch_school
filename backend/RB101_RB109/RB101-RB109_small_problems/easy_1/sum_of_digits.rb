# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
#
# INPUTS
# - positive integer
#
# OUTPUTS
# - integer
# - sum of the digits
#
# RULES
# - method takes one argument
# - a positive integer
# - sum the digits
# - return the sum
#
# DATA STRUCTURE
# - input is an integer
# - integer will need to be split into digits
# - no split method for integer
# - will need to convert to string to split then convert back to integer
#
# EXAMPLES
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
#
# ALGORITHM
# - convert the integer into a string
# - split the string to return an array of digits (as strings)
# - use #map! to return array with string to integers
# - Use #sum to add sum of integers in the array

# START
# array = integer.to_s.split => return array of digits as strings
# array.map! {|i| i.to_i } => return array of digits as integers
# array.sum => sum contents of array
#####################################

def sum_digits(number)
  array = number.to_s.split("")
  
  array.map! do |digit|
    digit.to_i
  end

  array.sum
end

