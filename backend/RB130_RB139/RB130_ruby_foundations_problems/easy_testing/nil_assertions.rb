# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'

require_relative 'temp_testing'

class RandomTestClass < MiniTest::Test
  def setup
    @value = TempTest.new(3)
  end

  def test_nil
    assert_nil(@value.nil_var)
  end
end
