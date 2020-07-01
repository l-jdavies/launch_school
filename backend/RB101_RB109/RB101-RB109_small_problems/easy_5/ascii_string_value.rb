# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument
# The ASCII string value is the sum of the ASCII values of every character in the string
#(You may use String#ord to determine the ASCII value of a character.)

# INPUT
# string - could only contain white space
#
# OUTPUT
# integer
#
# RULES
# return the ASCII string value of a string passed in as an argument
# string might be white space => return 0
# the method ord returns the ordinal of a one character string
#
# ALGORITHM
# use chars method to return an array of chars from the string
# use each method (or loop?) to iterate over the array
# initalise the variable value
# add the ordinal score of each array iteration to value
# return value

def ascii_value(string)
  array_of_strings = string.chars
  value = 0

  array_of_strings.each do |character|
    value += character.ord
  end
  value
end


