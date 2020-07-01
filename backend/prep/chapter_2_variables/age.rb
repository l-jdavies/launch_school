# Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.

puts "How old are you?"

age = gets.chomp
age = age.to_i

age10 = age + 10
age20 = age + 20
age30 = age + 30
age40 = age + 40

puts "In 10 years you will be: \n#{age10}"
puts "In 20 years you will be: \n#{age20}"
puts "In 30 years you will be: \n#{age30}"
puts "In 40 years you will be: \n#{age40}"

