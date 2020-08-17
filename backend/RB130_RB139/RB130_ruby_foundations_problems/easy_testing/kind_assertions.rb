# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class RandomClass < MiniTest::Test
  def setup
    @value = 3
  end

  def test_kind_of
    assert_kind_of(Numeric, @value)
  end
end
