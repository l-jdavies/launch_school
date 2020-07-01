# Write a program that takes a number from the user between 0 and 100 and 
# reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Enter a number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "Enter a positive number"
elsif number < 50
  puts "50 or less"
elsif number < 100
  puts "100 or less"
else
  puts "greater than 100"
end

# Rewrite your program from exercise 3 using a case statement. 
# Wrap this new case statement in a method and make sure it still works.

# case statement

puts "Enter a number between 0 and 100"
number = gets.chomp.to_i

answer = case
when number < 0
  "Enter a positive number"
when number < 50
  "50 or less"
when number < 100
  "100 or less"
else
  "greater than 100"
end
puts answer

# Wrap into a method 

def test_number(number)
  answer = case
  when number < 0
    "Enter a positive number"
  when number < 50
    "50 or less"
  when number < 100
    "100 or less"
  else
    "greater than 100"
  end
puts answer
end
