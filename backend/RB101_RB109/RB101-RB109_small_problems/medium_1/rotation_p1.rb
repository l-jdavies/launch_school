# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  rotated_arr = arr.dup

  rotated_arr.push(rotated_arr.shift)
end
