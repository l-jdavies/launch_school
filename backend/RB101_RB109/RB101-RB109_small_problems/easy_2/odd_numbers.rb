# Print all odd numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.
#
# INPUTS
# - no inputs
#
# OUTPUTS
# - print all odd numbers between 1 and 99
# - each number of new line
#
# RULES
# - print all odd numbers between 1 and 99
# - print odd numbers on separate lines
#
# DATA STRUCTURE
# - all integers
#
# EXAMPLES
#
# ALGORITHM
# - start count at 1
# - print 1 to output
# - add 2
# - print
###########################
def print_odd
  counter = 1
  until counter > 99
    puts counter
    counter += 2
  end
end
