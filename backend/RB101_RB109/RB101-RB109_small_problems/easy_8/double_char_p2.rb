# Write a method that takes a string, and returns a new string in which every consonant character is doubled
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def repeater(string)
  doubled = ''
  count = 0

  until count == string.length
    doubled << string[count] * 2
    count += 1
  end
  doubled
end

def double_consonants(string)
  doubled = ''
  count = 0

  until count == string.length
    if string[count].match(/^[a-z]+$/i) && !string[count].match(/[aeiou]/i)
      doubled << repeater(string[count])
    else
      doubled << string[count]
    end
    count += 1
  end
  
  doubled
end
