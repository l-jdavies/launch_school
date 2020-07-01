# Write a method that counts the number of occurrences of each element in a given array.
# vehicles = [
#  'car', 'car', 'truck', 'car', 'SUV', 'truck',
#  'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` 
# Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# INPUTS
# - An array containing multiple elements
#
# OUTPUTS
# - list of all elements in the array
# - number of times each element is present in the array
#
# RULES
# - elements are case sensitive
# - Output should be printed to terminal
#
# EXAMPLES
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
#
# DATA STRUCTURE
# - An array is provided as input
# - Create a hash to count each element
#
# ALGORITHM
# - Iterate over the array and determine which elements are unique
# - Add unique elements to new array (unique_elements)
# - Iterate over the original array and select elements that match elements
# - in unique_elements[0]
# - Add all elements that match unique_elements[0] to new array
# - Create a hash with unique_elements[0] as the key and the array of matching elements as the value
# - Add one to the unique_elements index count
# - Iterate over array until all index elements have been examined
# - puts the output using the hash key and value.count

# START
# index_counter = 0
# hash_element_count = {}
# unique_elements = array.uniq
# matching_element_array = array.select { |x| x == unique_elements[0] }
# hash_element_count[unique_elements[0].to_sym] = matching_element_array
#
# 
##########################################################

# I made this far too complicated and couldn't complete - below is LS answer

require 'pry'

vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
      'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  occurences = {}

  array.uniq.each do |element|
    occurences[element] = array.count(element)
  end

  occurences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)
