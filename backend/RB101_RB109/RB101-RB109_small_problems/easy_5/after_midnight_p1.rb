# The time of day can be represented as the number of minutes before or after midnight
# If the number of minutes is positive, the time is after midnight
# If the number of minutes is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm)
# Your method should work with any integer input.
# You may not use ruby's Date and Time classes.
#
# INPUT
# positive or negative integer or zero
#
# OUTPUT
# string representing time in 24 hr format
#
# RULES
# given an integer representing the number of minutes before (-) or after (+) midnight
# number of minutes could be more than minutes in a day (1440)
# 0 minutes => '00:00'
# hint that divmod, % and format might be useful
#
# ALGORITHM
# looking at divmod. 3000.divmod(1440) => [2, 120]
# that means 3000 divided by 1440 (min per day) has a reminder of 120 minutes
# that means it's 120 min after midnight => "02:00", the correct result
# 3.divmod(1440) => [0, 3]
#  it looks like the number i need to work with is the second element in the divmod array
#  there's no rules about specifying which day you are displaying the time for
#  if min < 60 the you can just add or subtract from 00:00
#  from the first divmod output, then need to calculate how many hr and min the first value represents
#  4231.divmod(1440) => [2, 1351]
#  1351.divmod(60) => [22, 31] i.e 22hrs and 31 min
#
#  COULDN'T FIGURE THIS ONE OUT - USED LS SOLUTION

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
require 'pry'
def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  binding.pry
  format('%02d:%02d', hours, minutes)
end

time_of_day(-1437)
