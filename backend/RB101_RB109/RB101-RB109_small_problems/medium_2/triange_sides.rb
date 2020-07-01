# A triangle is classified as follows:
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
#
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side
# and all sides must have lengths greater than 0: 
# if either of these conditions is not satisfied, the triangle is invalid.
#
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol
# :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
#
# ALGORITHM
# create a method to determine if triangle is valid
#   all lengths greater than 0?
#     if true
#       determine longest side
#       check if sum of two shortest sides is > than longest side
#   otherwise return false
#
# check if triange is valid?
#   if false
#     return :invalid
#   if true
#     are all sides equal?
#       if true return :equilateral
#     else are two sides equal?
#       if true return :isosceles
#     else
#       return scalene

def valid_triangle?(side1, side2, side3)
  return false if side1 < 1 || side2 < 1 || side3 < 1

  arr = [side1, side2, side3].sort
  longest = arr.pop

  return false if arr.sum < longest

  true
end

def triangle(s1, s2, s3)
  return :invalid if valid_triangle?(s1, s2, s3) == false

  if s1 == s2 && s2 == s3
    :equilateral
  elsif s1 == s2 || s2 == s3 || s2 == s3
    :isosceles
  else
    :scalene
  end
end
