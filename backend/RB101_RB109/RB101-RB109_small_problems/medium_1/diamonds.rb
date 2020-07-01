# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.
#
# INPUT
# odd integer
#
# OUTPUT
# several lines of strings containing whitespaces and *
#
# RULES
# create a 4 pointed diamond in an nxn grid
# n is supplied to the method as an odd integer
# input integer will always be odd
#
# ALGORITHM
# SET white_space = input integer divided by two
# SET stars = start at 1
#
# UNTIL stars equals input integer
# print (' ' * white_space) + ('*' * stars) + (' ' * white_space)
# decrement white_space by 1
# increment stars by 1
# END
#
# UNTIL stars equals 1
# print (' ' * white_space) + ('*' * stars) + (' ' * white_space)
# increment white_space by 1
# decrement stars by 1
# END
#
# END

def diamonds(num)
  if num == 1
    puts ' ' + '*' + ' '
    return
  end
  
  white_space = (num / 2)
  stars = 1

  loop do
    puts (' ' * white_space) + ('*' * stars) + (' ' * white_space)

    white_space -= 1
    stars += 2
    break if stars > num
  end

  white_space = 0
  stars = num

  loop do
    white_space += 1
    stars -= 2

    puts (' ' * white_space) + ('*' * stars) + (' ' * white_space)

    break if stars == 1
  end
end

