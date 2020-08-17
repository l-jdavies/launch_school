# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

require_relative 'temp_testing'

class RandomTestClass < MiniTest::Test
  def setup
    @value = TempTest.new(3)
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end
