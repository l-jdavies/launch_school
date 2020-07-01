# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers 
# between 1 and the entered integer.
#
# INPUT
# - an integer
# - option to sum or product
#
# OUTPUTS
# - input integer
# - input rule
# - value of calculation
#
# RULES
# - product = multiplying integers between 1 and given value
# - user will enter integer greater than 0
#
# DATA STRUCTURE
# -all integers
#
# EXAMPLES
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
# ALGORITHM
# - request user to enter an integer
# - assign to variable = max_number
# - request user to chose between computing the sum or product
# - start count at 1
# - until count == max_number
# - result => result + count
# - count += 1
# - or if user selects product
# - product = 1
# - result => result * count
# - count += 1
# - break loop when count == max_number
# - print results to terminal
#
###############################
require 'pry'
def sum_or_product
  puts ">> Please enter an integer greater than 0:"
  max_number = gets.to_i

  puts ">> Enter 's' to computer the sum, 'p' to compute the product."
  operation = gets.chomp

  count = 1
  sum = 0
  multiply = 1

  until count > max_number
    if operation == 's'
      sum = sum + count
      count += 1
    elsif operation == 'p'
      multiply = multiply * count
      count += 1
    else
      puts "Invalid operation. Enter 's' or 'p'."
    end
  end
  
  if operation == 's'
    puts "The sum of the integers between 1 and #{max_number} is #{sum}"
  else operation == 'p'
    puts "The product of the integers between 1 and #{max_number} is #{multiply}"
  end
end

sum_or_product
