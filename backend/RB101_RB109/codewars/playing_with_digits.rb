# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
# we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n
# Note: n and p will always be given as strictly positive integers.
#
# INPUT
# integer, n (min of two digits) and integer, p
#
# OUTPUT
# value of k or -1
#
# RULES
# n and p will always be positive
#
# ALGORITHM
# split `n` into digits
# determine the successive power of n digits, starting at p
# sum the power values and divide by `n`
#
# START
# SET power_arr = [] save power of n values
#
# SET digit_arr = transform `n` into a string, split into characters, transform each character into an integer
#
# iterate over `digit_arr` |digit|
#   calculate the power of `digit` to `p`
#   add value to `power_arr`
#   increment `p` by 1
# end
#
# SET k = sum the `power_arr` and divide by n
# IF `k` < 1, return -1
# ELSE return k
# END

def dig_pow(n, p)
  power_arr = []

  digit_arr = n.to_s.chars.map(&:to_i)

  digit_arr.each do |digit|
    power_arr << (digit ** p)
    p += 1
  end


  if power_arr.sum % n == 0
    k = power_arr.sum / n
  else
    -1
  end
end
