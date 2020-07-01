# Write a method that will return a substring based on specified indices
#
# INPUT
# string and two integers
#
# OUTPUT
# string
#
# RULES
# return characters from first index position of string to the second index position
#

def substring(word, idx1, idx2)
  word[idx1..idx2]
end
