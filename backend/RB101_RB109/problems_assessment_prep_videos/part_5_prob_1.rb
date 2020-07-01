# Write a method that takes an array of strings and returns an array of the same string values, except with the vowels removed
#
# INPUT
# array of strings
#
# OUTPUT
# array of strings
#
# RULES
# return new array or same array?
# remove vowels from string
#
# ALGORITHM
# iterate over array an access each word
# iterate over each word and access each character
# if the character is a constanant, keep the character
# if it's a vowel then discount it
# return transformed strings
# 
# START
# SET vowels_removed = []
# SET vowels = [array of vowels]
# split string into characters and iterate over individual characters
# add character to vowels_removed array UNLESS character == vowel
# join characters in vowels_removed arr
# RETURN vowels_removed
# END

def remove_vowels(str)
  vowels_removed = []
  vowels = %w(a e i o u)

  str.each do |word|
    temp_str = ''
    word.chars.each do |letter|
    temp_str << letter unless vowels.include?(letter)
    end
    vowels_removed << temp_str
  end
  vowels_removed
end
