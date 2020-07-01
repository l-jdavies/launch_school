# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# You may (and should) use the substrings_at_start method you wrote in the previous exercise:
#
# INPUT
# string
#
# OUTPUT
# array of strings
#
# ALGORITHM
# call the substrings_at_start method on the string argument
# call the sas method multiple times, removing one character from the start of the string each time
def substrings_at_start(string)
  substrings = []
  counter = 1

  until counter > string.size
    substrings << string[0, counter]
    counter += 1
  end

  substrings
end

def substrings(string)
  return_array = []
  counter = 0

  until counter > string.length
    return_array.concat(substrings_at_start(string[counter, string.length]))
    counter += 1
  end
  return_array
end

substrings('abcd')
