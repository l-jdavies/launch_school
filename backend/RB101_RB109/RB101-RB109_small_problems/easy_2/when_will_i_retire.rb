# Build a program that displays when the user will retire 
# and how many years she has to work till retirement.
#
# INPUTS
# - age of user
# - age of retirement
# - both will be strings - convert to integers
#
# OUTPUTS
# - the current year
# - year user will retire
# - how many years of work user has left
# - print output to screen
#
# RULES
# - calculate what year user will retire
# - calculate how many years until retirement
#
# DATA STRUCTURE
# - input will be strings that need to convert to integers
#
# EXAMPLES
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
#
# ALGORITHM
# - request users age
# - assign to variable current_age
# - request users age at retirement
# - assign to variable retirement_age
# - calculate how many years until retirement
# - years_to_retirement = retirement_age - current_age
# - calculate year of retirement
# - 2020 + years_to_retirement
# - print results to user
######################################################

def how_much_longer_to_retirement
  puts "What is your age?"
  current_age = gets.to_i

  puts "What age would you like to retire?"
  retirement_age = gets.to_i

  years_to_retirement = retirement_age - current_age
  year_of_retirement = 2020 + years_to_retirement

  puts "It's 2020. You will retire in #{year_of_retirement}."
  puts "You only have #{years_to_retirement} years of work to go!"
end
