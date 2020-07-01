# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.
# The input string always has more than five digits.
#
# INPUT
# string of digits
#
# OUTPUT
# integer
#
# RULES
# input string will always have more than 5 digits
#
# ALGORITHM
# SET idx = index position 5 in `input_str` that consecutive digits will start from
# SET largest_product = 0
#
# UNTIL `idx` == `input_str` length - 5
#   take characters in  `input_str` from `idx` to `idx` + 4 
#   transform into integers, split into digits and sum
#   if sum is greater than `largest_product`
#     re-assign sum to `largest_product`
# END
#
# return `largest_product`
# END
def greatest_product(n)
  idx = 0
  largest_product = 0

  loop do
    sum = n[idx, 5].chars.map(&:to_i).inject { |mem, num| mem * num }
    largest_product = sum if sum > largest_product
    idx += 1
    break if idx >= n.length - 4
  end
  largest_product
end

greatest_product("123834539327238239583")


