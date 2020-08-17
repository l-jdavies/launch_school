# Write a minitest assertion that will fail if the value.odd? is not true.


require 'minitest/autorun'

require_relative 'temp_testing'

class RandomTestClass < MiniTest::Test
  def setup
    @value = TempTest.new(3)
  end

  def test_odd
    assert_equal(true, @value.odd?)
  end
end
