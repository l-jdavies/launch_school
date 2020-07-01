# Write a function, persistence, that takes in a positive parameter num
# and returns its multiplicative persistence,
# which is the number of times you must multiply the digits in num until you reach a single digit.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# split input integer into digits
# multiply each digit
# repeat above process
# continue until return single digit
#

def persistence(int)
  return 0 if int.digits.length == 1

  num = int
  repeats = 0
  loop do
    num = num.digits

    num = num.inject { |mem, num| mem * num }
    repeats += 1
    break if num.digits.length < 2
  end
  repeats
end
