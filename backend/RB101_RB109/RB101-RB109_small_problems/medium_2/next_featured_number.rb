# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each.
# So, for example, 49 is a featured number, but 98 is not (it is not odd),
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument
# Issue an error message if there is no next featured number.
#
# INPUT
# integer
#
# OUTPUT
# integer or error message
#
# RULES
# featured number is:
#   multiple of 7
#   digits occur exactly once each
#
# ALGORITHM
# create a method to determine if an integer is a featured number
# intialize a current_integer local variable, which is input integer plus 1
# test if current number is a featured number?
#   if true, return current number
#   if false, increment current number by 1
# break the iteration if the current number equals 9_999_999_999
#
# START featured_number?(int)
#
# return false if number modulo 7 does not equal zero
#
# SET arr = `int` split into an array of digits
#
# iterate over `arr` to access each `digit`
#   return false if the count of `digit` in `int` is greater than 1
#
# otherwise return true
# END
#
# START featured(int)
# SET current_number = `int` + 1
#
# IF `current_number` is a `featured_number?`
#   return `current_number`
# ELSE
#   increment `current_number` by 1
#
# return "Not possible" IF current_number is equal to or greater than 9_999_999_999
# END

def featured_number?(int)
  return false if int % 7 != 0

  return false if int.even?

  int.digits.each do |digit|
    return false if int.digits.count(digit) > 1
  end
  true
end

def featured(int)
  current_number = int + 1

  loop do
    return current_number if featured_number?(current_number)
    current_number += 1
    return "Not possible" if current_number >= 9_999_999_999
  end
end
