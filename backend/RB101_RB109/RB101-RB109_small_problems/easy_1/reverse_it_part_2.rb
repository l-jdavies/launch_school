# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present.
#
# INPUTS
# - string
# - could contain one or multiple words
#
# OUTPUTS
# - return string
# - reverse words that have five or more characters
#
# RULES
# - only reverse words that have five or more characters
# - returned string should contain the original string, contained reversed
# and non-reversed words
# - spaces should only be included when >1 word present
#
# DATA STRUCTURE
# - input and output will be strings
# - spliting the string will return an array
#
# EXAMPLES
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS
#
# ALGORITHM
# - split the original string into individual words
# - #split method will return an array
# - iterate over the array and select words with #size > 5
# - #reverse! the selected words
# - use of #each and #reverse! should return the original array
# with only the selected words reversed
# - Use #join(' ') to join the array into a string
#
# START 
# 
# array_of_strings = string.split
# array_of_strings.each do |word|
#                 if word.size >= 5
#                   word.reverse!
#                   end
# array_of_strings.join
#
# END
###########################################################

def reverse_if_five_characters(string)
  array_of_strings = string.split
  
  array_of_strings.each do |word|
    if word.size >= 5
      word.reverse!
    end
  end
    array_of_strings.join(" ")
end

