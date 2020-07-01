# couldn't do this one - LS solution
statement = "The Flintstones Rock"

results = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  results[letter] = letter_frequency if letter_frequency > 0
end
