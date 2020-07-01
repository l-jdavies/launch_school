# INPUT
# string of numbers
#
# OUTPUT
# string converted to integers
#
# RULES
# convert string of numbers to integers
# cannot use to_i method or Integer()
#
# ALGORITHM
# create case statement i.e when '0' => 0
# split string into chars and assign returned array as variable
# iterate over array of strings - use map! to modify original array
# use case statement and save integer
# return array.join



def string_to_integer(string)
  array = string.chars

  array.map! do |i|
    case i
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    end
  end
  
  value = 0
  array.each { |i| value = 10 * value + i }
  value
end

  


