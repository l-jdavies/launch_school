# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, 
# and one the number of characters that are neither.
#
# INPUT
# string - could be one or more words
#
# OUTPUT
# hash containing count of lowercase, uppercase and neither characters
#
# RULES
# from the examples spaces should be counted as 'neither'
#
# ALGORITHM
# initialise a hash containing lowercase, uppercase and neither as the keys. Counts will be the values
# iterate over characters in the string
# determine if character is a alphabetic
# if not, add to neither
# if alphabetic, determine if character is uppercase, lowercase
# add to the hash count as appropriate
# return hash
#
# START
# SET case_counts = {} => start the hash with keys and values = 0
# SET alphabetic = ('A'..'Z').to_a + ('a'..'z').to_a
#
# string.chars.each do |character| => iterate over each character in the string
#   if alphabetic.include?(character)  
#     if character.upcase == character 
#       hash[:uppercase] += 1
#     else character.downcase == character
#       hash[:lowercase] += 1
#   else 
#       hash[:neither] += 1
#   end
# end
# hash
# END

def letter_case_count(string)
  alphabetic = ('A'..'Z').to_a + ('a'..'z').to_a

  case_counts = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  string.chars.each do |character|
    if alphabetic.include?(character)
      if character.upcase == character
        case_counts[:uppercase] += 1
      else character.downcase == character
        case_counts[:lowercase] += 1
      end
    else
      case_counts[:neither] += 1
    end
  end
  case_counts
end

