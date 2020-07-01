def double_numbers(numbers, multiplication_factor)
  doubled_array = []
  index_position = 0

  until index_position == numbers.size
    current_number = numbers[index_position]

    doubled_array << current_number * multiplication_factor
    index_position += 1
  end
  doubled_array
end

