def double_odd_index(numbers)
  doubled_numbers = []
  index_position = 0


  until index_position == numbers.size
    current_number = numbers[index_position]
    current_number *= 2 if index_position.odd?
    doubled_numbers << current_number
    
    index_position += 1
  end
doubled_numbers
end


