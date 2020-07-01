# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string
#  and returns the same string with all even indexed characters in each word upper cased
#  and all odd indexed characters in each word lower cased
#  The indexing just explained is zero based, so the zero-ith index is even
#  therefore that character should be upper cased.
#  The passed in string will only consist of alphabetical characters and spaces
#  Spaces will only be present if there are multiple words
#  Words will be separated by a single space
#
#  ALGORITHM
#  START
#  SET words = split `input_str` into an array
#
#  iterate over `words` to access each word |word|
#   iterate over each character with index in `word` |char, idx|
#     IF `idx` is even
#       re-assign character at `idx` position in `input_str` to uppercase version of character
#     ELSE
#       re-assign character at `idx` position in `input_str` to lowercase version
#     end
#   end
# end
#
# return `input_str`
# END
def weirdcase(str)
  array = str.split
  array.map! do |word|
    idx = 0
    loop do
      word[idx] = word[idx].upcase
      idx += 2
    break if idx >= word.length
    end
    word
  end
  array.join(' ')
end
weirdcase('This is a test')
