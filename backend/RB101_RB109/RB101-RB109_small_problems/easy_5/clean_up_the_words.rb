# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces
# 
# INPUTS
# string
#
# OUTPUTS
# return a string
#
# RULES
# string contains lowercase words plus non-alphabetic characters
# replace the non-alphabetic characters with a space
# if there's several non-alphabetic characters, replace with one space only
# no consecutive spaces
# assume we don't have to worry about integers?
# also includes ' within a word
#
# ALGORITHM
# split the string into an array of characters
# create an array of alphabetic characters (lowercase only)
# iterate over string char array and check if char is included in the array of alphabetic characters
# if true => add to final array
# if false => add a space
# unless the last character of the previous array is already a space
# join the final array
#

ALPHABET = ('a'..'z').to_a

def cleanup(string)
 
  cleaned_words = []
  
  string.chars.each do |character|
    if ALPHABET.include?(character)
      cleaned_words << character
    else
      cleaned_words << ' ' unless cleaned_words.last == ' '
    end
  end
  cleaned_words.join
end
