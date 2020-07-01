# Write a program that will ask for user's name. 
#  The program will then greet the user. If the user writes "name!" 
#  then the computer yells back to the user.
#
#  INPUTS
# - name from user
# - string
# - string may or may not contain '!'
#
#  OUTPUTS
# - string
# - Hello #{user}
# - or HELLO #{USER}. WHY ARE WE SCREAMING?
#
#  RULES
#  - request name from user
#  - if user includes ! in name
#  - print a different message in comparison
#  - to name input without !
#
#  DATA STRUCTURE
#  - all strings
#  - need to break string into characters to check for !
#  - #chars will return an array
#
#  EXAMPLES
#  What is your name? Bob
#  Hello Bob.
#
#  What is your name? Bob!
#  HELLO BOB. WHY ARE WE SCREAMING?
#
#  ALGORITHM
#  - request user to input their name
#  - assign to variable name
#  - split the string into characters
#  - #chars returns an array
#  - if array.include?(!)
#  - print uppercase message
#  - else print lowercase message
########################################################
def saying_hello
  puts "What is your name?"
  name = gets.chomp

  array = name.chars
  if array.include?('!')
    array.pop
    name = array.join
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end
