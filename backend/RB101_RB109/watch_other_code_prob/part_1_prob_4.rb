# Write a program that asks the user to enter an integer greater than zero, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
#
# INPUT
# integer as string from user
#
# OUTPUT
# integer
#
# RULES
# get integer greater than 0 from user
# ask if user wants to determine sum or product of all numbers from 1 to input integer
# return result of requested operation
#
# ALGORITHM
# ask user for integer greater than zero
# assign input to local variable
# transform input from string to integer
# ask user if they want to determine sum of product
# if user input is sum, return the sum of all integers from 1 to input integer
# if user input is product, return the product of all integers from 1 to input integer
#
# START
# GET integer > 0
# GET sum or product
# IF product
#   determine the product of all integers from 1 to input integer
# ELSIF sum
#   determine the sum of all integers from 1 to input integer
# ELSE
#   error message
# END
#
# TEST CASES
# sum_or_product(10, sum) #=> 55
# sum_or_product(5, product) #=> 120
#

def sum_or_product
  puts "Enter a number greater than zero:"
  num = gets.chomp.to_i

  puts "Would you like to determine the sum or product of number from 1 to #{num}?"
  operation = gets.chomp

  if operation == 'sum'
    (1..num).inject { |mem, num| mem + num }
  elsif operation == 'product'
    (1..num).inject { |mem, num| mem * num }
  else
    "Invalid response"
  end
end
