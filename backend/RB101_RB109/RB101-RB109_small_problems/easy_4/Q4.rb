def leap_year?(year)
  if year < 1752
    julian_leap(year)
  else
    gregorian_leap(year)
  end
end

def julian_leap(year)
  if year % 4 == 0
    true
  else
    false
  end
end
	
def gregorian_leap(year)
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

