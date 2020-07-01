def which_century(year)
  if year < 100
    1
  elsif year % 100 == 0
    year / 100
  else
    year / 100 + 1
  end
end
