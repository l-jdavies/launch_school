# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.
# 
# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".
# 
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

# PEDAC
#
# INPUT
# integer or binary as a string
#
# OUTPUT
# array containing commands
#
# RULES
# if input is invalid, return empty array
#
# ALGORITHM
# can convert decimal to binary by invoking `to_s(2)`
# essentially need to read the binary from right to left 
# 0 are ignored, only interested in 1's
# when binary digit is a 1, need to determine base10
#
# convert decimal into array
# iterate over `array` by index, starting at -1
# if binary digit is `1` then count how many index positions from -1 to index of current element
# use that count to determine base of binary digit
# convert binary digit to command
# add command to array
# return array
# 
# realised I should just reverse the binary number so I can iterate from L-R
#
# EXAMPLE
# an input of 9
# binary = "1001"
# first element from right is 1
# add "wink" to array
# moving from right to left, ignore 0's
# next 1 is at a position that equals 1000
# add "jump" to array
# return array
#
# PSEUDOCODE
# SET CODE = {} binary as key, command as value
# SET commands = [] array to be returned
#
# determine if invalid is valid
# convert input to `binary_str` (reversed)
#
# iterate over `binary_str` accessing each character and index |digit, idx|
#   IF digit is a '1'
#     base = idx - 1
#     binary = "1" << "0" * base
#     commands << CODE[binary]
#   END
#
# return commands
class SecretHandshake

  BINARY_CODE = {
    '1' => "wink",
    '10'=> "double blink",
    '100' => "close your eyes",
    '1000' => "jump"
  }
  
  def initialize(input)
    @binary = input
    invalid_input? ? (return Array.new) : convert_to_binary
  end

  def commands
    command_arr = []

    @binary.each_char.with_index do |digit, idx|
      if digit == '1'
        base = "1" 
        base << "0" * idx unless idx.zero?
        command_arr << BINARY_CODE[base] unless BINARY_CODE[base].nil?
      end
    end

    @binary.size >= 5 ? command_arr.reverse : command_arr
  end

  private

  def convert_to_binary
    @binary = @binary.to_i.to_s(2).reverse
  end

  def invalid_input?
    @binary.to_s.match?(/\D/)
  end
end
