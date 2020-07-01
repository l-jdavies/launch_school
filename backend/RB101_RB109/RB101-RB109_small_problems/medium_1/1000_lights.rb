# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off
# You walk down the row of switches and toggle every one of them
# You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on
# On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on
# You repeat this process and keep going until you have been through n repetitions.
#
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
#
# INPUT
# integer
#
# OUTPUT
# array of integers
#
# RULES
# input integer represents number of lights
# first round toggle lights that are divisible by 1
# second round toggle lights that are divisible by 2
# factor increments by 1 per round until factor == input integer
# return array with the lights that are switched on at the end of n rounds
#
# ALGORITHM
# START
# SET light_hsh => create hash with keys from 1 to num and values all 'off'
# SET divisor = 1
#
# UNTIL divisor == num
# select keys from light_hsh % divisor == 0
# iterate over keys and re-assign values to opposite status
#
# END

def switch_lights(num)
  light_hsh = {}
  (1..num).each { |key| light_hsh[key] = 'off'}
  
  divisor = 1

  loop do
    light_hsh.select { |k, v| k % divisor == 0}.each_pair { |k, v| light_hsh[k] = toggle(v) }
    divisor += 1
    break if divisor > num
  end
  light_hsh.select { |_, v| v == 'on' }.keys
end

def toggle(value)
  if value == 'on'
    'off'
  elsif value == 'off'
    'on'
  end
end
