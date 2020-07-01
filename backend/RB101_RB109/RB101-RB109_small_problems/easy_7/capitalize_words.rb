# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first 
# character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  array = string.split(' ')

  array.each do |word|
    word[0] = word[0].upcase
  end
  array.join(' ')
end
