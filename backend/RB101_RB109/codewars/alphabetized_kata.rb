# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

def alphabetized(str)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a

  str.chars.delete_if { |char| alphabet.include?(char) == false }
     .sort_by { |letter| letter.downcase }.join('')
end
