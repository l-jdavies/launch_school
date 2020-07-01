# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
#
# INPUTS
# string
#
# OUTPUTS
# integer
#
# RULES
# character counts are case insensitive
#
# ALGORITHM
# SET count = 0
# SET counted_characters = []
# 
# transform `input_str` to downcase
# iterate over each individual character |char|
#   IF `char` is present in `input_str` more than once:
#     increment count by 1 UNLESS `char` is already present in `counted_characters`
#     add `char`to `counted_characters`
# END
#
# return count
# END

def duplicate_count(str)
  count = 0
  counted_characters = []

  str.downcase.each_char do |character|
    if str.downcase.count(character) > 1
      count += 1 unless counted_characters.include?(character)
      counted_characters << character
    end
  end
  count
end
