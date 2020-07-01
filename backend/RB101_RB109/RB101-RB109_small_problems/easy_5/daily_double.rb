# Write a method that takes a string argument and returns a new string that contains the value
# of the original string with all consecutive duplicate characters collapsed into a single character.
# You may not use String#squeeze or String#squeeze!
#
# INPUT
# string
#
# OUTPUT
# string
#
# RULES
# return a new string with duplicate adjacent characters removed
#
# ALGORITHM
# initalize the variable, new string
# iterate over the characters in the string
# if a character is the same as the previous character, do not add the character to the new string
# return the new string
#
# START
#
# SET cleaned_string = ''
# split the string into characters and iterate over characters
# if char[1] == char[0] => don't add char[1] to new string
# return cleaned_string
# END

def crunch(string)
  cleaned_string = ''
  index = 0

  until index >= string.length
    cleaned_string << string[index] unless string[index] == string[index + 1]
  index += 1
  end

  cleaned_string
end


