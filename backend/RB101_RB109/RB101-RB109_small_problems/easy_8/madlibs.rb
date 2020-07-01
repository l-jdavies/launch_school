# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective
# nd injects those into a story that you create.
#
# INPUT
# string from user
#
# OUTPUT
# user string concatenated with computer string
#
# RULES
# get input from user
# output story
#

def madlib
  puts "Enter a noun:"
  noun = gets.chomp

  puts "Enter a verb:"
  verb = gets.chomp

  puts "Enter an adjective:"
  adjective = gets.chomp

  puts "Enter an adverb:"
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? Well done, that's great!"
end
