# Write a method that takes an array of strings, and returns an array of
# the same string values, except with the vowels (a, e, i, o, u) removed.
# 
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# initialize a new array
# initialize an array of vowels
# iterate over input array to access each element
# initialize a new string
# split each element into characters
# check if character is included in array of vowels
#   if true, move to next character
#   if false, move character to new string
#   add new string to return array
#
# return the final array
#
# START
# SET vowels = array containing vowels
# SET no_vowel_arr = array to be returned
#
# iterate over input array |word|
#   split word into characters
#   SET str = add to this string
#   iterate over characters |char|
#   check if `vowels` includes |char|
#     if true - next
#     if false 
#       add to `str`
#     add `str` to `no_vowels_arr`
# end
#
# no_vowel_arr
# END

def remove_vowels(str)
  vowels = %w(a e i o u)
  no_vowels_arr = []

  str.each do |word|
    new_str = ''
    word.chars.each do |letter|
      if vowels.include?(letter.downcase)
        next
      else
        new_str << letter
      end
    end
  no_vowels_arr << new_str  
  end
  no_vowels_arr
end

# Write a method that takes a string argument and returns a new string
# that contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. Dont use squeeze
# 
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# INPUT
# string
#
# OUTPUT
# new string
#
# RULES
# can't use `string`
# return new string object
# collapse consecutive duplicated characters into a single character
#
# ALGORITHM
# initialise `single_str`
# iterate over each character
# add character to `single_str` unless current character is the same as the character just added to `single_str`
#   - if its the same, move to next character
# return `single_str`
#
# START 
# SET single_str = new string to be returned
#
# iterate over `input_str` to access each character |char|
#   add `char` to `single_str` unless `char` == last element in `single_str`
# end
#
# single_str
# END

def crunch(str)
  single_str = ''

  str.each_char do |character|
    single_str << character unless character == single_str[-1]
  end
  single_str
end


