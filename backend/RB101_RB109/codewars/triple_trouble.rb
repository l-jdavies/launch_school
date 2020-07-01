# Write a function which takes numbers num1 and num2 and returns 1
# if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
# If this isn't the case, return 0
#
# ALGORITHM
# SET triple = 0
#
# transform `input_int` into a string and split into `arr` of characters
# 
# SET idx = 0
# UNTIL `idx` equals the length of `arr`
#   SET three_digits = []
#   store three digits from `idx` in `arr` to `three_digits`
#   check if all the digits in `three_digits` are the same as the digit at `idx`
#     if true, re-assign `triple` to the digit
#     if false, increment index by 1
# end
#
# transform second input integer to string
# check if it includes `triple` * 2
#   if true, return 1
#   if false, return 0
def triple_double(num1, num2)
  triple = nil
  idx = 0

  arr = num1.to_s.chars
  
  loop do
    three_digits = arr[idx, 3]
    
    if three_digits.all?(arr[idx])
      triple = arr[idx] unless three_digits.length < 3
      break
    else
      idx += 1
    end
    break if idx >= arr.length
  end

  return 0 if triple == nil

  if num2.to_s.include?(triple * 2)
    return 1
  else
    return 0
  end
end

triple_double(451999277, 41177722899)
