# Write a method that takes two arguments, a positive integer and a boolean, 
# and calculates the bonus for a given salary. 
# If the boolean is true, the bonus should be half of the salary. 
# If the boolean is false, the bonus should be 0.
#
# INPUTS
# - positive integer => salary
# - boolean => true == bonus (50% of salary); false == no bonus
#
# OUTPUTS
# - integer
# - bonus amount
#
# RULES
# - if boolean is false then returned bonus integer is always 0
# - if boolean is true then bonus is calculated
# - bonus is 50% of salary
# - salary will always be positive integer
#
# DATA STRUCTURE
# - integer and boolean as input
# - output will be integer
#
# EXAMPLES
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000
#
# ALGORITHM
# - if boolean == false, return 0
# - if bolean == true, salary / 2
#########################################

def calculate_bonus(salary, bonus)
  if bonus == false
    0
  else bonus == true
    salary / 2
  end
end

