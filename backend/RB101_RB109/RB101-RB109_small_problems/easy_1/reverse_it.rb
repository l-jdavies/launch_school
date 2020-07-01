# Write a method that takes one argument, a string, 
# and returns a new string with the words in reverse order.
# Examples:
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# INPUTS
# - string
#
# OUTPUTS
# - return string with the input in reverse order
#
# RULES
# - return the words in reverse order
# - maintain case
#
# DATA STRUCTURE
# - input and output are both strings
#
# EXAMPLES
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# ALGORITHM
# - split the input string into individual elements
# - reverse the elements
# - .split.reverse will return an array
# - join the array
###################################################################

def reverse_string(sentence)
  sentence.split.reverse.join(" ")
end
