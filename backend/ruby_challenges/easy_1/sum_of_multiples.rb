# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# PEDAC
#
# INPUT
# minimum input is an integer representing the maximum number
# input could also include various integers that are mutiples
#
# OUTPUT
# integer = sum of multiples
#
# RULES
# create a class method `to` that takes an integer as argument
# don't input input integer when creating range
# if no divisors are passed in as an argument, default to 3 and 5
# 2 or 3 divisor arguments could be passed in
#
# ALGORITHM
# n is argument to the class method `#to`
# `divisor` can be passed in when creating an instance of the `SumOfMultiples` class
# if no `divisor`s are passed in, default to `3` and `5`
# store `divisor` in `@divisor_arr`
# if `divisor` is empty then add 3 and 5 to `divisor_arr`
# within the `#to` method:
# 
# iterate over `divisor_arr`
# from 1 to `n`, any number that can be evenly divided by the current `divisor_arr`, add to `multiples` arr
# 
# sum all values within`multiples` array and return
#
# PSEUDOCODE
# SET @divisor_arr = if divisors are empty? add 3,5 otherwise [divisors]
# SET multiples = [] store factors of divisors
#
# iterate over `divisor_arr` |divisor|
#   from 1 upto n |num|
#     add num to `multiples` if num % divisor == 0
# end
#
# sum all elements within `multiples` and return

class SumOfMultiples
  def initialize(*divisors)
    @divisors_arr = divisors
  end

  def self.to(num)
    @divisors_arr = [3, 5] if @divisors_arr.nil?
    multiples = []

    @divisors_arr.each do |divisor|
      1.upto(num - 1) do |int|
        multiples << int if (int % divisor).zero?
      end
    end

    return 0 if multiples.empty?

    multiples.uniq.reduce(&:+)
  end

  def to(num)
    multiples = []

    @divisors_arr.each do |divisor|
      1.upto(num - 1) do |int|
        multiples << int if (int % divisor).zero?
      end
    end

    return 0 if multiples.empty?

    multiples.uniq.reduce(&:+)
  end
end

puts SumOfMultiples.to(20)
