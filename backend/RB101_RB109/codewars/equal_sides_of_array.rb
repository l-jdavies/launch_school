# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.
#
# INPUT
# array of integers
#
# OUTPUT
# integer
#
# RULES
# return index position or -1
#
# ALGORITHM
# iterate over array, access integers and index
# at each index position sum the integers to the left of the index and sum integers to the right of the index
# determine if the sums are equal
# if true, return index
# if none of the index positions evaluate to true, return -1
#
# START
#
# iterate over `input_arr`, |num, idx|
#   sum integers from [0] to (but not including) idx
#   sum integers from idx (not including) to -1
#   if both sums equal each other, return `idx`
#   else, move to next index position
# end
#
# if above iteration doesn't return true at any index position, return -1
# END

def find_even_index(arr)
  arr.each_with_index do |_, idx|
    if arr[0...idx].sum == arr[idx+1..-1].sum
      return idx
    end
  end

  -1
end
