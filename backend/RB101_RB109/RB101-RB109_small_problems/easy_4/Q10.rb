def signed_integer_to_string(number)
  case number <=> 0
  when +1
    "+#{integer_to_string(number)}"
  when -1
    "-#{integer_to_string(-number)}"
  else
    integer_to_string(number)
  end
end
