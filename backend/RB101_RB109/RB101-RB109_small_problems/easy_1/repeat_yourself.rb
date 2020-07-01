# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.
#
# PEDAC
#
# INPUTS
# - String
# - Integer
#
# OUTPUTS
# - String printed number of times as indicated by integer
# - Output is printed, not returned
# RULES
# - Will integer always be positive? Yes
# - Error if input is 0 or negative
# - Validate number
# - String should be printed on new line each time
#
# DATA STRUCTURE
# - Positive integer
# - String
# - Input is passed to method as argument, not requested from user
# 
# ALGORITHM
# - String and integer will be passed into method as arguments
# - Validate number is postive
# - Print string the number of times stated by integer
#
# START
#
# IF num > 0
#   num.times puts "string"
# END
#################################################

def repeat_yourself(string, number)
  if number > 0
    number.times { |i| puts string }
  else
    puts "0 is not a valid number"
  end
end
