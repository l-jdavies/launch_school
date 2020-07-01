# returns true / True if every element in an array is an integer or a float with no decimals.
#

def is_int_array(arr)
  return false if arr.is_a?(Array) == false

  return true if arr.empty?

  arr.all? { |num| num.is_a?(Integer) || num.is_a?(Float) && num.to_i == num }
end
