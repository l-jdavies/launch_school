# Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash
# Empty or nil input must return nil instead of a hash
# This hash returned must contain as keys the unique values of the array, and as values the counting of each value.
#
# The following methods were disabled:
# Array#count
# Array#length
#
# ALGORITHM
# SET return_hsh = {}
#
# SET unique = store unique integers from input array
# 
# iterate over `unique` to access each |number|
#   key each `number` is set as a key in `return_hsh` and value set to 0 
# end
#
# iterate over `input_hsh` to access each |number|
#   IF the keys from the `return_hsh` hash include `number` increment the `return_hsh` `number` value by 1
# end
#
# return `return_hsh`

def group_and_count(arr)
  return nil if arr == nil || arr.empty?

  return_hsh = {}

  unique = arr.uniq

  unique.each do |num|
    return_hsh[num] = 0
  end

  arr.each do |num|
    if return_hsh.keys.include?(num)
      return_hsh[num] += 1
    end
  end
  return_hsh
end
