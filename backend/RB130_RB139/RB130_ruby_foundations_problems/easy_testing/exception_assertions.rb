# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

class RandomClass < MiniTest::Test
  def test_exception
    assert_raises(NoExperienceError) { employee.hire }
  end
end
