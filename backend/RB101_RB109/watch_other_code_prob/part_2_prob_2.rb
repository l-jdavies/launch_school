# Write a method that finds all substrings in a string, no 1 letter words.
#
# INPUT
# single string
#
# OUTPUT
# array of sub strings
#
# RULES
# find all substrings from input string
# input string will be one string
# substring must be more than 1 character
#
# ALGORITHM
# split the string into an array of characters
# iterate over the array starting from idx 0 return range of elements
# start range at 0..1, then 0..2
# increase range until get to last element in the array
# repeat the process starting from idx 1
# repeat until process complete for all elements in array
#
# START
# SET arr = split string into characters
# SET idx = 0 element accessed to start range
# SET end_range = 1 range of elements accessed
# SET sub_str = []
#
# UNTIL idx is the same as arr length
#   UNTIL end_range is the same as arr length
#     sub_str << arr[idx..end_range]
#     end_range increment by 1
#   end
#   increment idx by 1
# end
#
# sub_str
# END
def substrings(str)
  idx = 0

  sub_str = []
  arr = str.chars

  loop do
    end_range = 1
    loop do
      sub_str << arr[idx..end_range] unless arr[idx..end_range].length < 2
      end_range += 1
      break if end_range == arr.length
    end
    idx += 1
    break if idx == arr.length
  end
  sub_str.map { |subarr| subarr.join('') }
end

substrings('band')
