# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class RandomClass < MiniTest::Test
  def setup
    @list = []
  end

  def test_refutations
    @list << "xyz"
    refute_includes(@list, "xyz")
  end
end
