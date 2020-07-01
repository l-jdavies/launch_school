# Find the longest substring in alphabetical order.
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

# ALGORITHM
# generate substrings
# store substrings in an array
# if substr is in alphabetical order
# add to array of alphabetical substrings
# sort that array
# return last element


def longest(str)
  
  alphabet_substr = find_substr(str).select do |substr|
    substr.chars == substr.chars.sort
  end
  alphabet_substr.sort_by! { |str| str.length }

  longest = alphabet_substr.select { |str| str.length == alphabet_substr.last.length }
  longest.shift
end

def find_substr(str)
  substr_arr = []
  idx = 0

  loop do
    substr_arr << (idx...str.length).map { |sub_length| str[idx..sub_length] }

    idx += 1

    break if idx == str.length
  end
  substr_arr.flatten!
end
