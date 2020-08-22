# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# create a #slices method which takes an integer as an argument (n)
# n determines the length of the consecutive number series
# #slices should return a nested array with each inner array containing n elements
# elements within nested array should be integers
# 
# split `str` into characters and convert to integers
# store array of integers in `num_arr`
# use #each_cons(n) to return an array of consecutive elements from `num_arr` (returns enumerator)
# transform enumerator into an array and return

class Series
  def initialize(str)
    @string_digits = str
  end

  def slices(n)
    fail ArgumentError.new if n > string_digits.length

    num_arr = string_digits.chars.map(&:to_i)

    num_arr.each_cons(n).to_a
  end
  private

  attr_reader :string_digits
end

series = Series.new('01234')
p series.slices(1)


