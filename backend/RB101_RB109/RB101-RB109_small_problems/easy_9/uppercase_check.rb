# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.
#
def uppercase?(str)
  arr = str.chars

  arr.all? { |word| word == word.upcase }
end
