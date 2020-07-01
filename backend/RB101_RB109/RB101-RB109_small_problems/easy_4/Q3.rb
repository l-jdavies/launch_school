def leap_year?(year)
  divided_by_four = year % 4 == 0
  divided_by_100 = year % 100 == 0
  divided_by_400 = year % 400 == 0

  if divided_by_four && (divided_by_100 && divided_by_400)
    true
  elsif divided_by_four == true && divided_by_100 == false
    true
  else
    false
  end
end
