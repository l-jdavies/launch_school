# Write a method that takes an array of strings, and returns an array of the same string values
# except with the vowels (a, e, i, o, u) removed
#
# INPUT
# array of strings
# could be one or multiple strings
#
# OUTPUT
# array of same string values but vowels removed
#
# RULES
# remove vowels from strings
# return same string values - not the same array?
# remove upper and lowercase vowels
#
# ALGORITHM
# iterate over the array of strings
# delete a character if it's not a vowel
# return the array
#
# START
# string.map do |word| =>iterate over each object in the array
#   word.delete('AEIOUaeiou')
# END

def remove_vowels(string)
  string.map do |word|
    word.delete('AEIOUaeiou')
  end
end
