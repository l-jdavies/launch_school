# Given: an array containing hashes of names
# Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand
#

def list(arr)
  return "" if arr.empty?

  str = []

  arr.each do |hsh|
    hsh.each do |k, v|
      str << v
    end
  end
 
  return str[0] if str.length < 2

  names = ''
  idx = 0

  until idx == str.length - 2
    names << str[idx] + ', '
    idx += 1
  end
  names << str[-2] + ' & '
  names << str[-1]
  
end
