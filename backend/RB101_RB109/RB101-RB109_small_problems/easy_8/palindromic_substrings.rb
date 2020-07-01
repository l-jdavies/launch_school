# Write a method that returns a list of all substrings of a string that are palindromic.
# The return value should be arranged in the same sequence as the substrings appear in the string
# Duplicate palindromes should be included multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# INPUT
# string
#
# OUTPUT
# array of strings
#
# RULES
# return array of palindromic substrings
# include duplicates
#
# ALGORITHM
# use the substrings method to create all possible substrings
# iterate over the array returned by substrings method
# if substring is a palindrome add to new array
# return new array

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

def palindromes(string)
  substrings(string).select do |substr|
    if substr.length > 1
      substr.reverse == substr
    end
  end
end
