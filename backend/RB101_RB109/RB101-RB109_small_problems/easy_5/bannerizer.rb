# Write a method that will take a short line of text, and print it within a box.
#
# INPUT
# string
#
# OUTPUT
# string with a box 
#
# RULES
# create a box
# print string within the box
#
# ALGORITHM
# pattern of the box:
# first line: (1x '+'), 2x plus length of string '-', (1x '+')
# second line: (1x '|'), 2x plus length of string ' ', (1x '|')
# third line: (1x '|'), 1x ' ', print string. if no string, as 2nd line, 1x ' ', (1x '|')
# fourth line: same as second line
# fifth line: same as first
#

def print_in_box(string)
  puts "+" + ('-' * 2) + ('-' * string.length) + '+' 

  puts '|' + (' ' * 2) + (' ' * string.length) + '|'

  puts '|' + ' ' + string + ' ' + '|'
  
  puts '|' + (' ' * 2) + (' ' * string.length) + '|'
  
  puts "+" + ('-' * 2) + ('-' * string.length) + '+' 
end


