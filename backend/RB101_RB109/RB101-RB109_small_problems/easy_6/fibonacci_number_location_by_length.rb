# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers
# are 1 by definition, and each subsequent number is the sum of the two previous numbers.
# This series appears throughout the natural world.
#
# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)
#
# INPUTS
# integer that represents the number of digits
#
# OUTPUTS
# the index position of the first number containing the number of digits in the input integer
#
# RULES
# the first Fibonacci number has an index of 1 (guess I start an array with 0 at the zero index position)
# first two numbers of Fibonacci sequence are always 1, 1
#
# ALGORITHM
# calculate Fibonacci number
# Fibonacci number is the sum of the previous two numbers
# sequence starts with 1, 1
# continue to calculate numbers in the Fibonacci sequence until
# the Fibonacci number contains the number of digits specified in the input
# then return an integer representing the index position of the final Fibonacci number
#
# START
# SET fib_array = [1, 1] => start with first numbers of Fibonacci seq
# SET first_index = 0 => access integers from array to calculate Fibonacci number
# SET second_index = 1
#
# UNTIL fib_number.digits.count == input_integer
#   fib_number = first + second => calculate Fibonacci number
#   fib_array << fib_number => add to array of Fibonacci numbers
#   first_index += 1
#   second_index += 1 => access next numbers in fib_array
# END
#
# fib_array.size
#
# END

def find_fibonacci_index_by_length(integer)
  fib_array = [1, 1]

  first_index = 0
  second_index = 1
  fib_number = 0

  until fib_number.digits.count == integer
    fib_number = fib_array[first_index] + fib_array[second_index]

    fib_array << fib_number

    first_index += 1
    second_index += 1
  end

  fib_array.size
end
