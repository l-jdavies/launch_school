# INPUT
# integer
#
# OUTPUT
# string
#
# RULES
# take a positive integer or zero
# return as a string
# can't use any Ruby conversion methods
#
# ALGORITHM
# initialize a string variable
# how to split the integer into digits without to_s?
# 4321.divmod(10) => [432, 1]
# assign first element (431) back to number and the second to digit (1)
# use hash to convert integer to string
# loop until number == 0
#
def integer_to_string(number)
  hash_of_integers = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}
  
  string =''
  loop do

  number, digit = number.divmod(10)
  
  string.prepend(hash_of_integers[digit])
  break if number == 0
  end
  string
end
  
