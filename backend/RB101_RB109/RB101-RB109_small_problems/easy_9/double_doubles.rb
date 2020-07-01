# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number
# double numbers should be returned as-is.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# if input integer is a 'double number' return input integer
# if not, return the input integer * 2
#
# ALGORITHM
# divide the integer physically in two
# if the left side number is the same as the right side
# return the input integer
# if not, double the input integer
#
def twice(integer)
  arr = integer.to_s.chars

  arr.length < 2 ? (return integer * 2) : nil
  
  first = arr[0..(arr.length / 2 - 1)]
  second = arr[(arr.length / 2)..-1]

  if first == second
    integer
  else
    integer * 2
  end
end

twice(37)
