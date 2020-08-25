# Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

# Note:
# Implement the conversion yourself. Do not use something else to perform the conversion for you. Treat invalid input as octal 0.
#
#
# PEDAC 
# From looking at test suite, Octal class object will be instantiated with octal number as a string
#
# INPUT
# octal number as string
#
# OUTPUT
# decimal as integer
#
# DATA STRUCTURE
# split string into array of characters
#
# ALGORITHM
# split string into array of characters
# transform all characters into integers
# iterate over the array from right to left
# n = 0
# reassign each element to return value of (current digit * (8 ** n))
# increment n by 1
# sum each element in the array and return value
#
# PSEUDOCODE
# SET power = 0
# SET idx = -1
# SET digits = split string into array of characters
#
# transform all elements in array to integers
#
# UNTIL idx == (-digits.length)
# digits[idx] = (digits[idx] * (8 ** power))
# power += 1
# idx -= 1
# END
#
# iterate over `digits` and sum all elements - return this value
class Octal
  attr_reader :octal_digits
  def initialize(octal)
    @octal_digits = octal.chars
  end

  def to_decimal
    return 0 if @octal_digits.any? { |el| !el.match(/[0-7]/) } 

    convert_to_octal
    @octal_digits.reduce { |accum, num| accum + num }
  end

  def convert_to_octal
    @octal_digits.map!(&:to_i)

    power = 0
    idx = -1

    loop do
      @octal_digits[idx] = (@octal_digits[idx] * (8 ** power))
      power += 1
      idx -= 1
      break if idx < -@octal_digits.length
    end
  end
end

test = Octal.new('234abc')
puts test.to_decimal
