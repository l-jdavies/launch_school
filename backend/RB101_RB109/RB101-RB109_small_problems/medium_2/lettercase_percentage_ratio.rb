# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters, 
# and one the percentage of characters that are neither.
#
# You may assume that the string will always contain at least one character.
#
# INPUT
# single string object
# can contain multiple words
# words with uppercase and lowercase letters plus other characters
#
# OUTPUT
# hash
# keys are lowercase, uppercase, neither
# values are the percentage of each character in the string
#
# RULES
# determine what percentage of characters in the string are uppercase or lowercase characters 
# 100 - sum of those percentages = neither
#
# ALGORITHM
# iterate over each character in the input string
# count how many characters are lowercase
# count how many characters are uppercase
# total string length - (lowercase + uppercase) = neither characters
# initialise a hash
# save the percentages as values

# START
# SET count_lowercase = 0
# SET count_uppercase = 0
# SET count_neither = 0
#
# iterate over each character in the input string |char|
#   IF `char` is the same as a lowercase version of `char`
#     increment `count_lowercase` by 1
#   ELSIF `char` is the same as uppercase version of `char`
#     increment `count_uppercase` by 1
#   ELSE
#     increment `count_neither` by 1
#   END
# END
#
# initialise a hash
# keys are `lowercase`, `uppercase` and `neither`
# values are the appropriate `count` variable divided by total characters multiplied by 100
#
# return hash
# END

def letter_percentages(str)
  count_lowercase = 0
  count_uppercase = 0
  count_neither = 0

  str.each_char do |char|
     if %w(1 2 3 4 5 6 7 8 9 0).include?(char)
       count_neither += 1
     elsif ('A'..'Z').include?(char)
       count_uppercase += 1
     elsif ('a'..'z').include?(char)
       count_lowercase += 1
     else
       count_neither += 1
     end

  end

  percent_lowercase = (count_lowercase.to_f / str.length) * 100
  percent_uppercase = (count_uppercase.to_f / str.length) * 100
  percent_neither = (count_neither.to_f / str.length) * 100

  hsh = {
    lowercase: percent_lowercase,
    uppercase: percent_uppercase,
    neither: percent_neither
  }
end
