# Recall that in the last exercise we only had to test one method of our Text class. One of the useful facets of the setup and teardown methods is that they are automatically run before and after each test respectively. To show this we'll be adding one more method to our Text class, word_count.
#
# Write a test for this new method. Make sure to utilize the setup and teardown methods for any file related operations.

require 'minitest/autorun'

require_relative 'text_swap_class'

class TestTextSwap < MiniTest::Test
  def setup
    @input_text = File.read("sample_text.txt")
    @test_text = Text.new(@input_text)
  end

  def test_word_count
    assert_equal(72, @test_text.word_count)
  end
end
