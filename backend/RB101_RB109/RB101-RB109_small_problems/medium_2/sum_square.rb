# Write a method that computes the difference between the square of the sum of the first n positive integers
# and the sum of the squares of the first n positive integers.
#
# INPUT
# positive integer
#
# OUTPUT
# integer
#
# RULES
# calculate the (sum of integers from 1 to n)squared
# caluclate the (square of integers from 1 to n squared)\
# calculate the difference between those values
#
# ALGORITHM
# SET sum_squared = sum the integers then square total
# SET squared_sum = square the integers then sum
#
# sum_squared:
#   from 1 to n
#     sum all the numbers
#     square the total
#
# squared_sum:
#   from 1 to n
#     square all numbers
#     sum each square
#
# return sum_squared - squared_sum
# END

def sum_square_difference(num)

  sum_squared = (1..num).to_a.sum ** 2

  squares = []

  (1..num).each { |n| squares << n ** 2 }

  squared_sum = squares.sum

  sum_squared - squared_sum
end
