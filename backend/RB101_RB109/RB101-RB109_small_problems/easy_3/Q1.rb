# Write a program that solicits 6 numbers from the user
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
#
# INPUT
# 6 numbers requested from user
# integer will be string
#
# OUTPUT
# print the output message
# print the 6th number then preceeding 5 numbers as an array
#
# RULES
# save the first five numbers in an array
# is the 6th number present in the array
#
# ALGORITHM
# request 6 numbers from the user
# assign string to variable and convert to integer
# add first five numbers to an array
# check if the final number is included in the array

def search_for_number(num)
  array = []
  puts "=> Enter the 1st number:"
  first = gets.chomp.to_i
  array << first

  puts "=>Enter the 2nd number:"
  second = gets.chomp.to_i
  array << second
  
  puts "=>Enter the 3rd number:"
  third = gets.chomp.to_i
  array << third

  puts "=>Enter the 4th number:"
  fourth = gets.chomp.to_i
  array << fourth

  puts "=>Enter the 5th number:"
  fifth = gets.chomp.to_i
  array << fifth

  puts "=>Enter the final number:"
  sixth = gets.chomp.to_i
  array << sixth

  if array.include?(sixth)
    puts "The number #{sixth} appears in #{array}."
  else
    puts "The number #{sixth} does not appear in #{array}."
  end
end








  
