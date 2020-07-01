# Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
# Print out all numbers between the two numbers,
# except if a number is divisible by 3, print "Fizz",
# if a number is divisible by 5, print "Buzz", 
# and finally if a number is divisible by 3 and 5, print "FizzBuzz".
#
# INPUT
# two integers
#
# OUTPUT
# integers and strings
#
# RULES
# print numbers from x to y
# if number divisible by 3, print fizz
# divisible by 5, print buzz
# if divisible by 3 and 15, print fizzbuzz
#
def fizzbuzz(num1, num2)
  result = []
  (num1..num2).to_a.each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << num
    end
  end
  result
end
