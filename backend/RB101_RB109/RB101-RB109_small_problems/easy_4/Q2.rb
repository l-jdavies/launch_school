# INPUT
# an integer that represents a year
#
# OUTPUT
# return the century the year belongs to
# return as a string with the correct suffix
#
# RULES
# return the century a year belongs to
# return as string with correct suffix
# new centuries begin in years that end with 01
# 1901 - 2000 => 20th century
#
# ALGORITHM
# if year < 100; century => 1st
# if year % 100 == 0; year / 100 => century
# else year / 100 + 1 => century
#
# 1st
# 2nd
# 3rd
# 4th
# 5th
# 6th
# 7th
# 8th
# 9th
# 10th
# 11th
# 12th
# 13th
# 14th
# 15th
# 16th
# 17th
# 18th
# 19th
# 20th
# 
# general rule, end in 1 => st; 2 => nd; 3 => rd; 0, 4..9 => th. 
# Exception => 11th, 12th, 13th
# case statement to determine suffix?
# Create one method for year and another method for determining suffix

def which_century(year)
  if year < 100
    century = 1
  elsif year % 100 == 0
    century = year / 100
  else 
    century = year / 100 + 1
  end
  century.to_s + century_suffix(century)  
end

def century_suffix(century)
  if [11, 12, 13].include?(century % 100)
    return 'th'
  end

  array = century.to_s.chars.map!(&:to_i)
  if array.last == 1
    'st'
  elsif array.last == 2
    'nd'
  elsif array.last == 3
    'rd'
  else
    'th'
  end
end



