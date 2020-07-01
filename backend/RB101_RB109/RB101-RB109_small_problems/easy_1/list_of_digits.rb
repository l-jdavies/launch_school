# Write a method that takes one argument, a positive integer, 
# and returns a list of the digits in the number.
#
# INPUTS
# - One positive integer
#
# OUTPUTS
# - Return an array
# - Array contains all digitals as individual elements
#
# RULES
# - Input will be positive
# - Return array of integers
# - Digits returned in same order as original integer
#
# EXAMPLES
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
#
# DATA STRUCTURE
# - Return an array
#
# ALGORITHM
# - Positive integer passed into method as an argument
# - Convert integer into string
# - Split the string into indvidual digits
# - Convert string into array
# - Maintain original order of digits
# - Iterate over array and transfrom each string to_i
# - Return array
#
# START
# 
# string = integer.to_s => "12345"
# string = string.split(//) => "['1', '2', '3', '4', '5']
# string.each { |i| i.to_i }
# 
# END
########################################################
def digit_list(integer)
  string = integer.to_s.split(//)
  array = string.map { |x| x.to_i }
end


