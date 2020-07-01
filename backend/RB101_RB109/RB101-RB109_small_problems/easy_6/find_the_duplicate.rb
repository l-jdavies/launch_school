# Given an unordered array and the information that exactly one value in the array occurs twice
# every other value occurs exactly once), how would you determine which value occurs twice?
# Write a method that will find and return the duplicate value that is known to be in the array.
#
def find_dup(array)
  array.find { |num| num if array.count(num) > 1 }
end

