# # Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.
#
# INPUT
# string
#
# OUTPUT
# boolean
#
# RULES
# return a boolean that determines if a string has the same number of ) as ( and if the index position of the ) is greater than index position of (
#
# ALGORITHM
# split the string into characters
# iterate over the characters
# check if there are the same number of close brackets as open brackets
# check if the close brackets occur after the open brackets
# check if string contains only close brackets
# return boolean value
#
# START
# SET open_idx = 0
# SET closed_idx = 0
# 
# chars = split string into array of characters 
# total_open = count how many ( in chars array
# total_closed = count how many ) in chars array
# 
# IF total_open does not equal total_closed RETURN false
# 
# iterate over chars array using `each_with_index`
# IF character == '('
#   open_idx == index position of (
# ElSIF character == )
#   closed_idx == index position )
# END
# end
#
# IF open_idx is not less than closed_idx RETURN false 
# ELSE return true
# END

def balancer(str)
  open_idx = 0
  closed_idx = 0

  chars = str.chars

  total_open = chars.count('(')
  total_closed = chars.count(')')

  return false if total_open != total_closed

  chars.each_with_index do |chr, idx|
    if chr == '('
      open_idx = idx
    elsif chr == ')'
      closed_idx = idx
    end
  return false if open_idx > closed_idx
  end

  open_idx < closed_idx ? true : puts("no parentheses in the string")
end
