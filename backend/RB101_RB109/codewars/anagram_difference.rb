# Given two words, how many letters do you have to remove from them to make them anagrams?
def anagram_difference(w1, w2)
  number_to_remove = 0

  (w1 + w2).chars.uniq.each do |letter|
    number_to_remove += ((w1.count(letter)) - (w2.count(letter))).abs
  end

  number_to_remove

end

