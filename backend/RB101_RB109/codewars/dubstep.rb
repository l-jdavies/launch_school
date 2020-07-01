# The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters
# Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.
#
# INPUT
# string
#
# OUTPUT
# string
#
# RULES
# remove all occurances of WUB and replace with a space
# remove any trailing spaces at start or end of returned string
#
# ALGORITHM
# substitute all occurences of WUB with a space
# split the string into an array of characters
# rejoin the characters into a string

def song_decoder(str)
  str.gsub('WUB', ' ').split.join(' ')
end
