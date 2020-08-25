# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# PEDAC
# INPUT
# single string
#
# OUTPUT
# hash with the word as key and count as value
#
# RULES
# return a hash
# ignore punctuation but keep apostrophes
# count shouldn't be case sensitive
# all keys should be lowercase
#
# DATA STRUCTURE
# hash
#
# ALGORITHM
# split the string into array of words `word_arr`
# transform all elements within `word_arr` to downcase
# iterate over all elements within `word_arr` and remove any punctuation at the start or end of each word
# iterate over each element in `word_arr` and count how many times each `word` occurs in `word_arr`
# return count

class Phrase
  def initialize(str)
    @phrase = str
    transform_word_arr
    @word_count = {}
  end

  def word_count
    @word_arr.uniq.each do |uniq_word|
      @word_count[uniq_word] = @word_arr.count { |word| word == uniq_word } unless uniq_word.empty?
    end

    @word_count
  end

  private

  def transform_word_arr
    @word_arr = @phrase.split(/[\s,]/).map(&:downcase).map { |word| word.gsub(/\A\W+|\W+\z/, "") }
  end
end

