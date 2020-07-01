# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
#
# INPUT
# string
#
# OUTPUT
# boolean
#
# RULES
# return true if the string contains only balanced pairs of parentheses
# otherwise return false
#
# ALGORITHM
# START
# return false if count of ( does not equal count of )
# 
# SET open_idx = index position of (
# SET closed_idx = index position of )
#
# split string into array of characters and iterate over individual characters with index position |chars, idx|
#   IF chars is (
#     open_idx = index position of chars
#   ELSIF chars is )
#     closed_idx = index position of chars
#   END
#   return false if index position of closed_idx is less than open_idx
# END
# otherwise return true
# END

def balanced?(str)
  return false if str.count('(') != str.count(')')
  
  idx = 0
  str.chars.each do |char|
    if char == '('
      idx += 1
    elsif char == ')'
      idx -= 1
    end
    break if idx < 0
  end
  idx == 0 ? true : false
end
