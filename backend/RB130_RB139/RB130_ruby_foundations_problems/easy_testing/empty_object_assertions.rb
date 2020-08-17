# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class RandomTest < MiniTest::Test
  def setup
    @list = Array.new
  end

  def test_empty_array
    assert(@list.empty?)
  end
end
