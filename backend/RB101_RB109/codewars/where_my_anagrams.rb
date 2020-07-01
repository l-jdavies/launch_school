# Write a function that will find all the anagrams of a word from a list.
# You will be given two inputs a word and an array with words.
# You should return an array of all the anagrams or an empty array if there are none
#
# INPUT
# one string
# one array containing multiple strings
#
# OUTPUT
# array of strings or empty array
#
# RULES
# return an array containing all words that are anagrams of the input string
#
# ALGORITHM
# iterate over each word in the array
# if the word is an anagram of the input string, add to new array
# if false, next
# return new array

def anagrams(str, arr)
  anagrams = []

  arr.each do |word|
    if word.chars.sort.join('') == (str.chars.sort.join(''))
      anagrams << word
    else
      next
    end
  end
  anagrams
end
