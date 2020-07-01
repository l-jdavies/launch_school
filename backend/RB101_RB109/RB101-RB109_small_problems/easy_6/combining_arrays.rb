# Write a method that takes two Arrays as arguments, and returns an Array 
# that contains all of the values from the argument Arrays
# There should be no duplication of values in the returned Array
# even if there are duplicates in the original Arrays.
#
# This can be easily achieved with the Array#union method - no need for PEDAC

def merge(array1, array2)
  array1.union(array2)
end
