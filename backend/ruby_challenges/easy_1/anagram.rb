# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.


class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    anagrams = []
    word_array = @word.downcase.chars.sort

    candidates.each do |str|
      if str.downcase == @word.downcase
        next
      elsif str.downcase.chars.sort == word_array
        anagrams << str
      end
    end

    anagrams
  end
end

