# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.
# 
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

# PEDAC
# INPUTS
# string - could be one word or multiple words in single string
#
# OUTPUTS
# single string
#
# RULES
# all consonant at the start of each word are moved to the end of the word
# when the first letter of each word is a vowel, append 'ay' to word
# edge cases from test suite:
# looking at test suit, words begining with 'yt' are treated as begining with vowels
# not sure if this is an edge case
# words beginning with 'y' are treated as 'y' is a consonant
# treat as a word starting with a vowel: 'xr' 
# if word has 'qu', move both 'q' and 'u' to the end of the word
# based on test suite, only need to create one class method `translate` that takes an argument
# looks like all tests are lowercase
#
# DATA STRUCTURE
# might be easiest to split the string into a nested array with subarrays containing individual characters?
# easier to move elements around
#
# ALGORITHM
# will tackle problem using regex
# split string into nested array - each subarray contains each word split into characters (`string_arr`)
# iterate over `word_arr` to access each subarr |word|
#   UNTIL first element of `word` is a vowel OR first two elements are 'yt'
#     remove the first element from `word` and add it to the end of the subarray
#   END
# 
# join all characters in each subarray into a string
# add 'ay' to the end of each word
# join all words into single string and return
class PigLatin
  def self.translate(str)
    word_arr = str.split.map(&:chars)
    
    word_arr.each do |word|
      until word.join.match?(/^[aeiou]|^yt|^xr|^qu/)
          word << word.shift
      end
      2.times { word << word.shift } if word.join.match?(/^qu/)
    end
   
    word_arr.map!(&:join)
            .map { |word| word << "ay" }

    word_arr.size > 1 ? word_arr.join(" ") : word_arr.join
  end
end

