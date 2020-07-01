# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

first_array = [2, 4, 67, 64, 7434236239]
second_array = first_array.map { |x| x + 2 }
p first_array
p second_array
