# In this kata you are required to, given a string, replace every letter with its position in the alphabet.
# If anything in the text isn't a letter, ignore it and don't return it.
#
# INPUT
# string
#
# OUTPUT
# string of digits
#
# RULES
# replace letter with digit as a string
# if character isn't a letter - ignore it
# return digits as one string
# whitespace between each digit
#
# ALGORITHM
# SET letter_score = create hash with letter as key and position as the value
#
# SET digits_str = empty string, store letter positions
# 
# downcase the `input_str`
# split `input_str` into characters and iterate over characters
#   if character is not included in `letter_score` keys, move to next character
#
#   add to `digits_str` the value of the `character` from `letter_score` key
# end
#
# return `digits_str`
# END

def alphabet_position(str)
  letter_score = {}
  position = 1
  ('a'..'z').to_a.each do |letter|
    letter_score[letter] = position.to_s
    position += 1
  end

  digits_str = []
  str.downcase.each_char do |character|
    next if letter_score.keys.include?(character) == false

    digits_str << letter_score[character]
  end
  digits_str.join(' ')
end
