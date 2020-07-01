# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3

  case average
  when 0..59 then "F"
  when 60..69 then "D"
  when 70..79 then "C"
  when 80..89 then "B"
  else "A"
  end
end
