# Write a method that counts down to zero using recursion.

def count_down(number)
  if number <= 0
    puts number
  else
    puts number
    number = number - 1
    count_down(number)
  end
end

count_down(10)
count_down(-20)
