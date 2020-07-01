# Given a string of words separated by spaces, 
# write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.
# You may assume that every word contains at least one letter, and that the string will always contain at least one word. 
# You may also assume that each string contains nothing but words and spaces
#
# INPUTS
# string
# contains at least one word
#
# OUTPUTS
# string
#
# RULES
# input will only contain words or spaces
# return a string in which the first and last letter of each word is swapped
# maintain original case
#
# ALGORITHM
# break string down into individual words
# iterate over each word and swap the first letter with the last letter
# re-join the string into the full sentence
# return the string
#
# PSUEDOCODE
# array of words = string.split(' ')
# access the first and last letters by index position
# first = string[0]
# last = string[-1]
# delete the first and last characters from the string
# word = last + string + first
# iterate over array of words using map!
# return the mutated string

def swap(string)
  array_of_words = string.split(' ')

  array_of_words.map! do |word|
    if word.length < 2
      word
    else
      first = word[0]
      last = word[-1]

      word.delete!(first).delete!(last)

      word = last + word + first
    end
  end

  array_of_words.join(' ')
end

letter_swap('Oh what a wonderful day it is')
