def counting_characters
  puts "Please write a word or multiple words:"
  string = gets.chomp
  count = string.delete(" ").size

  puts "There are #{count} characters in \"#{string}\"."
end

