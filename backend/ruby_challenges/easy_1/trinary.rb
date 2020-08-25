# Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

# PEDAC
# INPUT
# trinary number as a string
#
# OUTPUT
# decimal as an integer
#
# RULES
# only 0, 2 and 2 are valid input values
# invalid input should return 0
#
# DATA STRUCTURE
# split string into array of characters
#
# ALGORITHM
# split the string into an array of characters
# check if all strings in array are valid input - if false, return 0
# transform characters into integers
# iterate over the array from right to left
# replace current element with return value of (current element * (3 ** n))
# n is initially 0
# increment n by 1
# move to the next element in the array (to the left)
# once all elements in the array have been transformed to trinary value
# sum values and return
#
# PSEUDOCODE
# SET digit_arr = split string into characters
# SET idx = -1
# SET power = 0
#
# return 0 if `digit_arr` contains any value except 0, 1 or 2
#
# UNTIL idx == -digit_arr.length
# digit_arr[idx] = digit_arr[idx] * (3 ** power)
# idx -= 1
# power += 1
# END
#
# sum all values within `digit_arr` and return value
class Trinary
  def initialize(num)
    @trinary_characters = num.chars
  end

  def to_decimal
    return 0 if @trinary_characters.any? { |char| char.match(/\D|[3-9]/) }
   
    trinary_values
    @digit_arr.reduce { |accum, num| accum + num }
  end

  def trinary_values
    @digit_arr = @trinary_characters.map(&:to_i)

    power = 0
    idx = -1

    loop do
      @digit_arr[idx] = @digit_arr[idx] * (3 ** power)
      power += 1
      idx -= 1
      break if idx < -@digit_arr.length
    end
  end
end
