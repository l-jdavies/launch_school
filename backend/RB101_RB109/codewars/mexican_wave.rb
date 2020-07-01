# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
# Rules:
# The input string will always be lower case but maybe empty
# If the character in the string is whitespace then pass over it as if it was an empty seat.

def wave(str)
  wave_arr = []

  str.each_char.with_index do |letter, idx|
    next if letter == ' '

    wave_arr << str[0...idx] + letter.upcase + str[idx+1..-1]
  end
  wave_arr
end
