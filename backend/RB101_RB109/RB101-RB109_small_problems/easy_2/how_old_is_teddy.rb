# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

# INPUT
# - no input
#
# OUTPUT
# - string interpolated with random number
#
# RULES
# - generate a random number between 20 and 200
# - print the random number as Teddy's age
#
# DATA STRUCTURE
# - generate random number
# - interpolate with string
#
# EXAMPLES
# - Teddy is 69 years old!
#
# ALGORITHM
# START
# age = random number(20..200)
# puts "Teddy is #{random_number} today"
# END
######################################################
def teddys_age(name='Teddy')
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end
