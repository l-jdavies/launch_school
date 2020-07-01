# Write a method that takes a positive integer, n, as an argument, and displays a right triangle
# whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle, and the other end at the upper-right.
#
# INPUTS
# integer
#
# OUTPUTS
# triangle of starts containing n stars
#
# RULES
# n == number of lines of stars
# the last line contains n number of stars
# the precending lines contain n = (n-1) where stars are replaced with spaces until there's one star
#
# ALGORITHM
# the first line will be (n - 1) of spaces and one star
# second line is n-2 of spaces and two stars
# this pattern continues until number of stars == n
#
# START
# SET spaces = n - 1
# SET stars = 1
#
# UNTIL stars > n
#
#   puts (' ' * spaces) + ('*' * stars)
#
#   spaces -= 1
#   stars += 1
# END
#
# END

def triangle(n) 
  spaces = n - 1
  stars = 1

  until stars > n
    puts (' ' * spaces) + ('*' * stars)

    spaces -= 1
    stars += 1
  end
end
#
#   
