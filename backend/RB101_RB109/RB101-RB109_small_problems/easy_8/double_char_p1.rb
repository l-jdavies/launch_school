# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  doubled = ''
  count = 0

  until count == string.length
    doubled << string[count] * 2
    count += 1
  end
  doubled
end
