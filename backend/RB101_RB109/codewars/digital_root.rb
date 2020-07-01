# Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
#
# ALGORITHM
# split input integer into digits
# sum the digits
# repeat process until sum is a single digit

def digital_root(int)
  total = int.digits.sum

  until total.digits.length == 1
    total = total.digits.sum
  end
  total
end
