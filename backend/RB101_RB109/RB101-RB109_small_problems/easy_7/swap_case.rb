# Write a method that takes a string as an argument and returns a new string in which every uppercase letter
# is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  uppercase = ('A'..'Z').to_a
  lowercase = ('a'..'z').to_a

  array = string.chars.map do |character|
    if uppercase.include?(character)
      character.downcase
    elsif lowercase.include?(character)
      character.upcase
    else
      character
    end
  end
  array.join
end
