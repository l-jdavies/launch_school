=begin
A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.
=end

# INPUTS
# two strings - one input string, list of exceptions as one string

# OUTPUTS
# string in title case 

# RULES
# first word is always capitalized
# capitalise remaining words, unless word is an exception
# if it's an exception, return in lowercase

# ALGORITHM
# split both strings into arrays - `str_arr` and `exception_arr`
# iterate over `str_arr`
# element at index 0 will be capitalized
# capitalize remaining elements in `str_arr` unless element is included in `exception_arr`
# if element is included in `exception_arr` then lowercase element
# return joined `str_arr`

# SET `str_arr` = spliting `str` into array of words
# SET `exception_arr` = spliting `exceptions` into array of words

# iterate over `str_arr`
# if idx == 0 
#    - capitalize

# if element is included in `exception_arr`
#   - element.lowercase
# else 
#  - capitalize the element
#
# return joined str_arr 


def title_case(str, exceptions='')
  str_arr = str.split
  exception_arr = exceptions.downcase.split
  
  str_arr.each_with_index do |word, idx|
    word.capitalize! if idx == 0
    
    
    if exception_arr.include?(word.downcase)
      word.downcase! unless idx == 0
    else
      word.capitalize!
    end
  end
  str_arr.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
