# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.
# 
# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:
# 
# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
# For any digits that thus become 10 or more, subtract 9 from the result.
# 1111 becomes 2121.
# 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
# Add all these digits together.
# 1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
# 8763 becomes 7733, and 7+7+3+3 is 20.
# If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).
# 
# Write a program that, given a number
# 
# Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid.
# Can return the checksum, or the remainder from using the Luhn method.
# Can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit. This should give "2323 2005 7766 3554" in response to "2323 2005 7766 355".
# About Checksums:
# 
# A checksum has to do with error-detection. There are a number of different ways in which a checksum could be calculated.
# 
# When transmitting data, you might also send along a checksum that says how many bytes of data are being sent. That means that when the data arrives on the other side, you can count the bytes and compare it to the checksum. If these are different, then the data has been garbled in transmission.
# 
# In the Luhn problem the final digit acts as a sanity check for all the prior digits. Running those prior digits through a particular algorithm should give you that final digit.
# 
# It doesn't actually tell you if it's a real credit card number, only that it's a plausible one. It's the same thing with the bytes that get transmitted -- you could have the right number of bytes and still have a garbled message. So checksums are a simple sanity-check, not a real in-depth verification of the authenticity of some data. It's often a cheap first pass, and can be used to quickly discard obviously invalid things.

# PEDAC
# Testing the line: "In the Luhn problem the final digit acts as a sanity check for all the prior digits. Running those prior digits through a particular algorithm should give you that final digit."
#
# Using the example "2323 2005 7766 355", which is invalid but adding a "4" as the check digit, will create a valid number
# it looks like a valid number would have an even number of digits
#
# doubling every second digit, starting from the first digit on the left:
# 4343 4005 5736 651 
# sum those digits = 56
# 56 + 4 = 60
# which results in a valid number
#
# INPUT
# integer
#
# OUTPUT
# integer
# 
# RULES
# from looking at the test suite the following instance methods are required:
# `addends` - returns an array containing the input integer split into digits, with every second digit doubled and - 9 if doubled digit is > 9
#
# `checksum` returns the sum of the `addends` array
#
# `valid?` returns boolean, true if input integer is valid, else false
#
# the following class method is required:
# `create` - return a valid integer from the input integer
#
# ALGORITHM
# `addends`:
# split `input_int` into array of digits
# because algorithm moves from right to left I'll reverse the array
# now I can operate from right to left
# iterate over the array accessing each element and index
# if the index is odd
#   double the element
#   if this return value is > 9, subtract 9
# mutate the values in calling array
# reverse and return array
#
# `checksum`:
# sum the return value of the `addends` method

# `valid?`
# does the return value of `checksum` evenly divide by 10
# return boolean
#
# `create`
# class method
# need to use the instance methods
# not sure if it's good practise to create instance variable within class method?
# could create an instance of the class within the class method?
# if number is not valid
#   initialize a `count` = 1
#   add `count` to `checksum` value
#   repeat until `valid?` returns true
#   convert input integer into a string
#   add `count` to end of input integer
#   convert integer string back into integer and return
class Luhn
  def initialize(num)
    @number = num
    @number_arr = num.to_s.chars.map(&:to_i).reverse
  end

  def self.create(num)
    create_num = Luhn.new(num)

    create_num.create_valid_number if !create_num.valid?
  end

  def create_valid_number
    count = 0
    @number_arr.unshift(count)
    
    loop do
      break if valid?
      @number_arr[0] += 1
    end

    @number_arr.reverse.join.to_i
  end
  
  def addends
    ends = @number_arr.map.with_index do |digit, idx|
      if idx.odd?
        digit *= 2
        digit -= 9 if digit > 9
      end
      digit
    end
    ends.reverse!
  end

  def valid?
    (checksum % 10).zero?
  end

  def checksum
    addends.inject(&:+)
  end
end

