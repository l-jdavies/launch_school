# You will be given a number and you will need to return it as a string in Expanded Form.
# Note: All numbers will be whole numbers greater than 0.
#
# INPUT
# one integer
#
# OUTPUT
# integers and symbol as string
#
# RULES
# break integer into composite digits as a string
#
# ALGORITHM
# convert to string and split into array of characters
# initialize str
# initialize arr of strings
#
# iterate over over array of integer characters
# move the first element into a new string
# count the length of the character array
# add x number of zeros to new string
# add new string to array of strings with + symbol
# perform in a loop until array of integer characters is empty
# join array of strings into a string and return
#
# START
# SET arr_str = initialize empty array to store strings
# SET digits = split input integer into array of digits as strings
#
# UNTIL digits is empty
# SET digit_str = ''
# shift the first element of `digits`  to `digit_str`
# num_of_zeros = length of `digits` array
# add '+' to `arr_str`
# add `num_of_zeros` * '0' to `digit_str`
# add digit_str to arr_str
#
# join the arr_str and return

def expanded_form(number)
  arr_str = []
  digits = number.to_s.chars

  until digits.empty?
    digit_str = ''
    
    if digits.first == '0'
      digits.shift
      next
    else
      digit_str << digits.shift
    end
    
    num_zeros = digits.length

    digit_str << '0' * num_zeros

    arr_str << digit_str
    arr_str << " + " unless digit_str.length == 1
  end

  arr_str.pop if arr_str.last == ' + '
  arr_str.join('')
end
