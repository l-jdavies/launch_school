# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. 
# You may assume that the argument is a valid integer value.
#
# PEDAC
#
# INPUTS
# - One integer
# - Can be positive, negative or zero
#
# OUTPUTS
# - Return true if number is odd
# - Otherwise return false
#
# RULES
# - "Absolute value" means number value, without regard to sign i.e. ignore -
# - Can't use the #odd? or #even? methods
# - Assume argument is valid integer
#
# DATA STRUCTURE
# - One integer
#
# EXAMPLES
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
#
# ALGORITHM
# Return true if number is odd 
# 
# START
# num % 2 != 0 -> returns true
####################################
def is_odd?(number)
  number % 2 != 0
end

# The Integer#remainder method performs a remainder operation in Ruby.
# Rewrite #is_odd? to use Integer#remainder instead of %.

def is_odd?(number)
  number.remainder(2) != 0
end
