# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words.
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
# You should also print the number of words in the longest sentence.
#
# INPUT
# string
#
# OUTPUT
# integer that represents the number of words in the longest sentence
#
# RULES
# sentence may end with . ! or ?
# any character other than a space or sentence ending character should be counted as a word
# return number of words in the longest sentence
#
# ALGORITHM
# substitute any ! or ? for .
# split the string into an array of elements based on presence of .
# sort the array in ascending order
# remove the last element from the array and determine length of the element
# return that value
#

def longest_sentence(str)
  str.gsub(/[?!]/, '.').split('.').sort_by { |sentence| sentence.length }.pop.split.length
end
