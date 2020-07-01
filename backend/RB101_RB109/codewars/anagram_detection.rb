# Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.
#
# Note: anagrams are case insensitive

def is_anagram(test, original)
  test.downcase.chars.sort == original.downcase.chars.sort
end
