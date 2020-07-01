# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
# All letters will be lowercase and all inputs will be valid.
#
# INPUT
# string containing multiple words
#
# OUTPUT
# string comtaining one word
#
# RULES
# all letters will be lowercase
# all inputs will be valid
# if two words have the same score, return the first word in original string
#
# ALGORITHM
# create a hash to associate letter with word score
# iterate over each word and determine the value
# save the word and value to a new hash
# retrieve word with highest score from hash
# return word

def high(str)
  letter_hsh = {}
  value = 1
  ('a'..'z').to_a.each do |letter|
    letter_hsh[letter] = value
    value += 1
  end

  word_score_hsh = {}

  str.split.each do |word|
    score = 0
    word.chars.each do |character|
      score += letter_hsh[character]
    end
    word_score_hsh[word] = score
  end
  highest_score = word_score_hsh.values.max
  word_score_hsh.key(highest_score)
end
