# Create a simple tip calculator
# The program should prompt for a bill amount and a tip rate
# The program must compute the tip and then display both the tip and the total amount of the bill.
#
# INPUTS
# - bill amount
# - tip rate
# - both will be integers
#
# OUTPUTS
# - tip amount => float
# - bill amount + tip => float
#
# RULES
# - calculate the tip amount
# - add tip amount to bill
# - print both tip amount and final bill total as floats
# - no rules about error handling
# - output floats should be 1 decimal place
#
# DATA STRUCTURE
# - inputs will be integers
# - outputs will be floats interpolated with string
#
# EXAMPLES
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0
# 
# ALGORITHM
# - request user to input the bill amount
# - assign to bill variable
# - request user to input the till percentage
# - assign to tip variable
# - calculate the tip amount (bill * (tip/100)) => float
# - add tip amount to bill amount => float
# - print the tip and total amounts
#####################################################
require 'pry'

def tip_calculator
  puts "What is the bill?"
  bill = gets.to_i

  puts "What is the tip percentage?"
  tip = gets.to_f

  tip_amount = bill * (tip/100)
  #binding.pry
  bill_total = bill + tip_amount

  puts "The tip is $#{tip_amount.to_f}"
  puts "The total is $#{bill_total.to_f}"
end

tip_calculator
