# INPUTS
# integer
#
# OUTPUTS
# return an integer
#
# RULES
# 1. find all multiples of 3 or five between 1 and input integer
# 2. sum the mulitples
# assume input is > 1
#
# ALGORITHM
# between 1 and n find all multiples of 3
# save to array
# between 1 and n find all multiples of 5
# save to array
# sum array of multiples
# return the sum
#
# START
# FOR 1..n if i % 3 == 0 => save to array
#     1..n if i % 5 == 0 => save to array
#     some numbers are multiples of 3 and 5 => return uniq integers in array
# RETURN array.sum

def multisum(number)
  array = []
  
  (1..number).select { |i| array << i if i % 3 == 0 || i % 5 == 0 }

  array.uniq!

  array.sum
end
