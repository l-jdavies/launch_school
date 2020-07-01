# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in which every other character is capitalized,
# and the remaining characters are lowercase.
# Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.
#
# INPUTS
# string containing letters and integers
#
# OUTPUTS
# string with every second character uppercase
#
# RULES
# don't change the case of non-alphabetic characters
# but still count them as characters for uppercase pattern 
# spaces also count as characters
# start with first character as uppercase
# ignore original case of string
#
# ALGORITHM
# split the string into characters
# start a loop
# access every other character by index
# re-assign every other character to upcase version of the character
# don't worry about checking if character is alphabetical - original character will be returned if upcase number or symbol
# break loop when index > array length
# join the array into a string

def staggered_case(string)
  array = string.split('')

  upper = 0
  lower = 1

  loop do
    array[upper] = array[upper].upcase
    upper += 2

    array[lower] = array[lower].downcase
    lower += 2
    break if lower >= array.size
  end
  
  if array.size.odd?
    array.last.gsub!(array.last, array.last.upcase)
  end
  array.join('')
end
