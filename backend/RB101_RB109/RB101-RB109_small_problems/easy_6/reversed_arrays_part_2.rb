# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order
# Do not modify the original list.
# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

def reverse(array)
  index = -1

  new_array = []
  loop do
  new_array << array[index]

  index -= 1

  break if index < -(array.size)
  
  end
  new_array
end

