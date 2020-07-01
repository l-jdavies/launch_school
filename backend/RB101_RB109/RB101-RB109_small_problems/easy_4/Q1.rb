def short_long_short(string1, string2)
  string_1 = string1.length
  string_2 = string2.length

  if string_1 > string_2
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end
