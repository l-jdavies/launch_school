def string_to_signed_integer(string)
  if string.chars.first == '-'
    string = string.chars
    string.delete_at(0)
    string = string.join
    string_to_integer(string) * -1
  elsif string.chars.first == '+'
    string = string.chars
    string.delete_at(0)
    string = string.join
    string_to_integer(string)
  else
    string_to_integer(string)
  end
end

def string_to_integer(string)
  array = string.chars

  array.map! do |i|
    case i
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    end
  end
  
  value = 0
  array.each { |i| value = 10 * value + i }
  value
end

string_to_signed_integer('570')
