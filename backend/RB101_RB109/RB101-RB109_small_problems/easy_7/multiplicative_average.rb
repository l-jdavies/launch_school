# Write a method that takes an Array of integers as input, multiplies all the numbers together
# divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places
# Assume the array is non-empty.
#
# INPUT
# array of integers
#
# OUTPUT
# string containing the result to 3 decimal places
#
# RULES
# 1. multiply all integers in the array by each other
# 2. divide the result by 3
# 3. determine result to 3dp
#
# ALGORITHM
# multiply all integers in the array by each other
# assign result to variable
# divide variable by 3
# determine the result to 3 dp
# print the result using string interpolation
#
# START
# multiply = array.reduce {|mem, num| mem *= num }
# result = (multiply / array.size).to_f
# 3 dp => format('%.3f', result)
# END

def show_multiplicative_average(array)
  result = (array.reduce { |mem, num| mem *= num } / array.size.to_f)
  result = format('%.3f', result)

  puts "The result is #{result}"
end
