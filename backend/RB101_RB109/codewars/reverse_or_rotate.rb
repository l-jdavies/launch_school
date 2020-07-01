# The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).
# f a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.
# If:
# sz is <= 0 or if str is empty return ""
# sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
#
# PROBLEM
#   1. inputs will be a string of digits, `str` and an integer, `sz`
#   2. divide `str` into substrings of `sz` length
#   3. for each substring, calculate the cube (to the power of 3) of each digit in the substring
#   4. sum the cube values. If the sum is divisible by 2:
#     - reverse the substring
#     - if not, rotate substring to the left by one position
#   5. join the substrings together (in original order) and return as a string
# 
# INPUT
# string of digits
# integer
#
# OUTPUT
# string of digits
#
# RULES
# if `sz` is <= 0 or if `str` is empty, return empty string
# if `sz` is > length of `str`, return empty string
#
# ALGORITHM
# IF `sz` is <= 0 return ""
# IF `str` is empty return ""
# IF `sz` is > `str` length, return ""
#
# SET input_str_arr = split the `str` into an array of characters
# SET chunk_arr = store `str` chunks
# SET transformed_chunks = store transformed strings
#
# UNTIL `input_str_arr` is empty, move `sz` number of elements, joined into one object, into `chunk_arr`
#
# iterate over `chunk_arr` to access each subarray of digits |chunk|
#   SET cube_arr = store the cube of each digit
#   iterate over each digit in each `chunk` subarray |digit|
#     transform into an integer,
#     calculate the cube of the integer and save in `cube_arr`
#   end
#
#   IF sum of the `cube_arr` can be evenly divided by 2
#     reverse the chunk, join it into single string and save in `transformed_chunks`
#   ELSE
#     swap the first and last elements in the chunk and save in `transformed_chunks`
# END
#
# join the elements in `transformed_chunks` and return
# END

def revrot(str, sz)
  return "" if sz > str.length || sz <= 0 || str.length < 1

  chunk_arr = []
  transformed_chunks = []

  input_str_arr = str.chars

  until input_str_arr.length < sz
    chunk_arr << input_str_arr.shift(sz)
  end
  
  chunk_arr.each do |subarray|
    cube_arr = []
    subarray.each do |digit|
      cube_arr << digit.to_i ** 3
    end
  
    if cube_arr.sum % 2 == 0
      transformed_chunks << subarray.reverse
    else
      subarray.push(subarray.shift)
      transformed_chunks << subarray
    end
  
  end
  transformed_chunks.flatten.join('')
end
