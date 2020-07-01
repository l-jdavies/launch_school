def find_substrings(str)
  idx = 0
  substr_arr = []
  
  loop do
    substr_arr << (idx..str.size - 1).map { |substr_size| str[idx..substr_size] }
    idx += 1
    break if idx >= str.length
  end

  substr_arr.flatten
end

find_substrings('hello')

