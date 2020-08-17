# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

class RandomTest < MiniTest::Test
  def setup
    @list = Array.new
  end

  def test_included_object
    @list << "xyz"
    assert_includes(@list, "xyz")
  end
end
