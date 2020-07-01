# The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.
#
# INPUT
# string
#
# OUTPUT
# string
#
# RULES
# character counts are not case sensitive
# includes non alphanumeric characters
# count whitespace as a character
#
# ALGORITHM
# START
# SET new_str = ''
#
# iterate over each character in the input string |char|
#   IF the number of times `char` appears in `input_str` is > 1
#     add ')' to `new_str`
#   ELSE
#     add '(' to `new_str`
# END
#
# return `new_str`

def duplicate_encode(str)
  new_str = ''

  str.downcase.each_char do |character|
    if str.downcase.count(character) > 1
      new_str << ')'
    else
      new_str << '('
    end
  end
  new_str
end
