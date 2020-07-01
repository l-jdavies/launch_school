# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.
#
# INPUT
# Two array of strings
#
# OUTPUT
# one array of strings
#
# RULES
# don't mutate input arrays
# return array can only contain unique strings
#
# ALGORITHM
# iterate over `a2` and create an array of substrings for each word in `a2`
# iterate over `a1`. For each word test if it is present in the `a2` substring array
# if true, add to return array
#
# START
# SET a2_substr = create an array of substrings
# SET return_arr = store `a1` strings that are substrings of `a2` elements
#
# iterate over `a2` and create substrings for each word
#
# iterate over `a1` and access each |word|
#   IF `word` is included in the `a2_substr` array
#     add `word` to `return_arr`
#   ELSE
#     move to next `word`
# end
#
# return `return_arr`

def substr(arr)
  substr = []

  arr.each do |str|
    idx = 0
    loop do
      substr << (idx...str.size).map { |sublength| str[idx..sublength] }
      idx += 1
      break if idx >= str.length
    end
  end
  substr.flatten!
end

def in_array(arr1, arr2)
  a2_substr = substr(arr2)

  return_arr = []
  arr1.each do |str|
    return_arr << str if a2_substr.include?(str)
  end
  return_arr.uniq.sort
end
