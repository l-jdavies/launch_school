# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.
# Note: 1 square meter == 10.7639 square feet
# Do not worry about validating the input at this time.
#
# INPUT
# - integers
# - length
# - width
# - input will be meters
#
# OUTPUT
# - print integer
# - calculate area in square meters
# - convert area to square feet
#
# RULES
# - area => length * width => square meters
# - area in square meters * 10.7639 => square feet
# - don't need to validate input
# - request input from user
# - area should be float
#
# DATA STRUCTURE
# - all integers
#
# EXAMPLES
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
#
# ALGORITHM
# - request user to enter length of room in meters
# - save as length variable
# - request user to enter width of room in meters
# - save as width variable
# - calculate area in square meters (length * width)
# - convert area to square feet (area m2 * 10.7639)
# - print results to user
#######################################
def room_area
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f

  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f

  area_meters = length * width
  area_feet = (area_meters * 10.7639).round(2)

  puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."
end
