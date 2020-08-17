# Write a test that will fail if list and the return value of list.process are different objects.

# haven't implemented @list or #process

require 'minitest/autorun'

class RandomTest < MiniTest::Test
  def test_same_object
    assert_same(@list, @list.process)
  end
end
