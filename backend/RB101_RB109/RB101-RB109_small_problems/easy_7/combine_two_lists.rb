# Write a method that combines two Arrays passed in as arguments, and returns a new Array
# that contains all elements from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.
#

def interleave(array1, array2)
  return_array = []

  until array2.empty?
    return_array << array1.shift(1)
    return_array << array2.shift(1)
  end
  return_array.flatten
end
