# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175
# Keep the first 2 digits fixed in place and rotate again to 321759
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579
# The resulting number is called the maximum rotation of the original number.
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
# You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# using the `rotate_rightmost_digits` method, rotate a decreasing number of digits 
# until calling `rotate_rightmost_digits` would return the calling object
# return the last integer the `rotate_rightmost_digits` can be called on
#
# ALGORITHM
# start by calling `rotate_rightmost_digits` where num2 is the length of the integer
# decrement num2 by 1 until num2 == 1
#
# START
# SET rotation => length of integer (.digits.count)
# 
# WHILE rotation > 1
# rotated_number = rotate_rightmost_digit(input_integer, rotation)
# rotation -= 1
#
# rotated_number
# END

def max_rotation(number)
  rotation = number.digits.count
  rotated_number = number

  until rotation <= 1
    rotated_number = rotate_rightmost_digits(rotated_number, rotation)
    rotation -= 1
  end
  rotated_number
end

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
