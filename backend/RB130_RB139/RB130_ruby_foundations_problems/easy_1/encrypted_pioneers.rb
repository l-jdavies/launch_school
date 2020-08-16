# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
# Write a program that deciphers and prints each of these names

# PEDAC
# Rot13 is a simple letter substitution that replaces the letter with the 13th letter after it in the alphabet.
#
# Algorithm
# convert input string to lowercase
# create an array of lowercase alphabet
# split input string into array of characters
# iterate over array of characters
#   for each character, iterate over alphabet
#   if character == el in alphabet
#   add 13 to index
#   return el in alphabet arr at new index
#   add el to new array
#   if character isn't included in alphabet, add " " to new array
# capitalize each word in array
# join the new array by " "

# START
# input_str = convert input str to lowercase and split into array of characters
# ALPHABET = array containing lowercase letters of alphabet
# decrypted = []
#
# iterate over input_str using map! |char|
#   rot_idx = nil
#   ALPHABET.each_with_index |letter, idx|
#     rot_idx = (idx + 13) if char == letter
#   end
#
#   ALPHABET[rot_idx]

require 'byebug'
ALPHABET = ('a'..'z').to_a

def decrypt(str)
  input_str = str.downcase.chars
  
  input_str.map! do |char|
    rot_idx = nil
    ALPHABET.each_with_index do |letter, idx|
      if letter == char && idx <= 12
        rot_idx = idx + 13
      elsif letter == char && idx >= 13
        rot_idx = idx - 13
      end
    end

    rot_idx.nil? ? " " : ALPHABET[rot_idx]
  end

  input_str.join.split.map(&:capitalize).join(' ')
end

puts decrypt("Nqn Ybirynpr")
puts decrypt("Tenpr Ubccre")
puts decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")


