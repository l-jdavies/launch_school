# Write a class that will display:

# ABC
# xyz
#
# when the following code is run:
# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_accessor :input_str

  def initialize(str)
    @input_str = str
  end

  def uppercase
    self.input_str = input_str.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

