# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)


# INPUT
# two integers
#
# OUTPUT
# return one integer
#
# RULES
# rotate last n digits of input integer
# n => second input integer
# if n => 1, original integer is returned\
# n will be positive
# use `rotate_array` method from p1
#
# ALGORITHM
# Divide the integer into two arrays
# n determines the number of elements to copy into the second array
# call `rotate_array` on the second array
# merge array 1 with array 2
# join the merged array into a string
# transform the string into an integer and return
#
# SET unchanged_arr = []
# SET rotate_arr = []
#
# integer_arr => convert integer into a string and split into individual characters 
# rotate_arr << n number of characters from end of integer_arr 
# unchanged_arr << characters from start to position -n of integer_arr
#
# convert integers in rotate_arr to integers
#
# rotate_arr = rotate_array(rotate_arr) => method doesn't mutate argument so capture output as local variable
#
# both arrays need to be arrays of strings
# merge unchanged_arr and rotate_arr
# join the arrays
# convert string to integer and return
# END

def rotate_rightmost_digits(num1, num2)
  unchanged_arr = num1.to_s.chars

  rotate_arr = unchanged_arr.slice!(-num2, num2)

  rotate_arr.map!(&:to_i)

  rotate_arr = rotate_array(rotate_arr)

  rotate_arr.map!(&:to_s)

  (unchanged_arr + rotate_arr).join('').to_i
end

def rotate_array(arr)
  rotated_arr = arr.dup

  rotated_arr.push(rotated_arr.shift)
end
