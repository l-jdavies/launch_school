# Write a method that returns a list of all substrings of a string that start at the beginning of the original string
# The return value should be arranged in order from shortest to longest substring.
#
# INPUT
# string
#
# OUTPUT
# array of strings
#
# RULES
# return an array of substrings of a string
# return order should be shortest to longest
#
# ALGORITHM
# start from first character of a string
# add one more character
# each time a character is added, add the substring to an array
# when substring is length of original string, return the array

# SET substrings = []
# SET counter = 1
# SET sub = ''
# 
# UNTIL counter == string.size
# substring << string[0, counter]
# counter += 1
# END
#
# substrings
# END

def substrings_at_start(string)
  substrings = []
  counter = 1

  until counter > string.size
    substrings << string[0, counter]
    counter += 1
  end

  substrings
end
