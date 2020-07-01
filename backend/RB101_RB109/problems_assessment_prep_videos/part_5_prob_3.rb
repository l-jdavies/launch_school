# # Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.
#
# INPUT
# two integers
#
# OUTPUT
# array of integers
#
# RULES
# return array of integers between the two input integers that are prime numbers
# can't use the `prime` class
#
# ALGORITHM
# create a range of integers from input num 1 to input num 2
# iterate over the integers and determine if integer is a prime
# a prime number is:
#   - > 1
#   - can only be evenly divided by 1 and `self`
# if integer is prime, add to return array
# return array
#
# START
# SET prime_arr = []
# FOR num between x and y
#   iterate over integers
#   IF integer is greater than 1 and can only be divided by 1 and itself
#     prime_arr << integer
# END
# prime_arr
# END
#
# START (is_prime?(num))
# RETURN false if num < 2
# for i in 2..(num - 1) 
#   if num % i == 0
#   RETURN false
# else
#   true
# END

def is_prime?(num)
return false if num < 2
  for i in 2..(num -1)
    if num % i == 0
      return false
    end
  end
  true
end

def find_primes(num1, num2)
  prime_arr = []
  for i in num1..num2
    if is_prime?(i)
      prime_arr << i
    end
  end
  prime_arr
end
