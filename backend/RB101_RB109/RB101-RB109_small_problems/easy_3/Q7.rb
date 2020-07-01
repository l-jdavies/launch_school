def oddities(array)
  return_array = []
  index_position = 0

  while index_position < array.size
    return_array << array[index_position]
    index_position += 2
  end
  return_array
end

oddities([2, 3, 4, 5, 6])
oddities([1, 2, 3, 4, 5, 6])
oddities(['abc', 'def'])
oddities([123])
oddities([])
