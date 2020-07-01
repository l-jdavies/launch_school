# Sort the given strings in alphabetical order, case insensitive.
#
# INPUT
# array of strings
#
# OUTPUT
# array of strings
#
# RULES
# return sorted array with original case
#
# ALGORITHM
#

def sortme(str)
  str.sort_by { |word| word.downcase }
end
