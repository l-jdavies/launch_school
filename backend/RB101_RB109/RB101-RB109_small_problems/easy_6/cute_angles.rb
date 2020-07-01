# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees 
# and returns a String that represents that angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes,
# and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
#
# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.
# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".
# You may use this constant to represent the degree symbol: DEGREE = "\xC2\xB0"
#
# INPUT
# float that represents an angle between 0 and 360 degrees
#
# OUTPUT
# string that represents the angle as degrees, minutes and seconds
#
# RULES
# use the degree constant to print the degree symbol; ' => minutes; " => seconds
# a degree has 60 minutes
# a minutes has 60 seconds
# used https://www.thoughtco.com/decimal-degrees-conversion-1434592 to figure out calculation
# 
# the whole units of degrees remains the same i.e. 76.73 = 76 degrees
# multiply the decimal portion of the figure by 60. Whole number becomes minutes
# multiply the decimal by 60 to calculate seconds
#
# ALGORITHM
# split the float at the decimal
# first number is the degrees
# assign second number to variable (cal_min_sec)
# cal_min_sec is used to calculate min and sec
# set number of min in a degree and number of seconds in a minute as constants
# multiply min_sec by 60 min
# split the float at the decimal
# first number becomes minutes
# assign second number to variable (cal_sec)
# multiply cal_sec by 60 => number of seconds
# use string interpolation to return the output
# use format to display values as 2 dp = format('%02d', number) 
#
# START
# SET MIN_PER_DEGREE = 60
#     MIN_PER_SECOND = 60
#     
#     degree, cal_min_sec = float.to_s.split('.')
#     => first number assigned to degree as string
#     => second number assigned to cal_min_sec as string
#
#     degree = degree.to_i => return value for degree
#     cal_min_sec = cal_min_sec.to_f => need multiplication result to be a float
#
#     minutes, cal_sec = (cal_min_sec * MIN_PER_DEGREE).to_s.split('.')
#
#     minutes = minutes.to_i => return value for minutes
#     cal_sec = cal_sec.to_i
#
#     seconds = cal_sec * MIN_PER_SECOND => return value for seconds
# 
# PRINT
#    format(%(#{degree}#{DEGREE}%02d'%02d"), minutes,seconds)
# END
DEGREE = "\xC2\xB0"
MIN_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MIN_PER_DEGREE * MIN_PER_SECOND

def dms(float_number)
  total_seconds = float_number * SECONDS_PER_DEGREE
  degree, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  
  puts format(%(#{degree}#{DEGREE}%02d'%02d"), minutes, seconds)
end



