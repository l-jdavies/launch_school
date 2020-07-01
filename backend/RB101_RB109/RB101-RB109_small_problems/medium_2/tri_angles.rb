# A triangle is classified as follows:
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
#
# To be a valid triangle, the sum of the angles must be exactly 180 degrees,
# and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol 
# :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.
#
# You may assume integer valued angles so you don't have to worry about floating point errors.
# You may also assume that the arguments are specified in degrees.

def valid_triangle?(s1, s2, s3)
  return false if s1 < 1 || s2 < 1 || s3 < 1

  return false if arr = [s1, s2, s3].sum < 180

  true
end

def triangle(s1, s2, s3)
  return :invalid if valid_triangle?(s1, s2, s3) == false

  if s1 == 90 || s2 == 90 || s3 == 90
    :right
  elsif s1 < 90 && s2 < 90 && s3 < 90
    :acute
  else
    :obtuse
  end
end
