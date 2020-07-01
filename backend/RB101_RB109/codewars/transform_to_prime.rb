# Given a List [] of n integers , find minimum mumber to be inserted in a list, so that sum of all elements of list should equal the closest prime number .
# List size is at least 2 .
# List's numbers will only positives (n > 0)
# Repeatition of numbers in the list could occur .
# The newer list's sum should equal the closest prime number .
# 
# INPUT
# array of integers
#
# OUTPUT
# integer
#
# RULES
# input array will contain at least 2 integers
# input integers will always be positive
# could contain same number more than once
#
# ALGORITHM
# determine sum of array
# increment sum value by 1 until value is a prime number
# minus sum of array from increment value
#
# START
# SET sum_value = sum of `input_arr`
#
# UNTIL `sum_value` is a prime number
#   increment `sum_value` by 1
# END
#
# `sum_value` - sum of `input_arr`
# END
require 'prime'
def minimum_number(arr)
  sum_value = arr.sum

  until sum_value.prime?
    sum_value += 1
  end

  sum_value - arr.sum
end
