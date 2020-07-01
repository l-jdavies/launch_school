# Write a method that takes a non-empty string argument,
# and returns the middle character or characters of the argument. 
# If the argument has an odd length, you should return exactly one character.
# If the argument has an even length, you should return exactly two characters.
#
def center_of(string)
  idx = string.length / 2  
  if string.length.odd?
    string[idx]
  else
    string[idx - 1] + string[idx]
  end
end
