# For this exercise you'll be given a sample text file and a starter class. The sample text's contents will be saved as a String to an instance variable in the starter class.

# The Text class includes a #swap method that can be used to replace all occurrences of one letter in the text with another letter. And for this exercise we will swap all occurrences of 'a' with 'e'.

# Your task is to write a test suite for class Text. In that test suite write a test for the Text method swap. For this exercise, you are required to use the minitest methods #setup and #teardown. The #setup method contains code that will be executed before each test; #teardown contains code that will be executed after each test.

require 'minitest/autorun'

require_relative 'text_swap_class'

class TestTextSwap < MiniTest::Test
  def setup
    @input_text = File.read("sample_text.txt")
    @test_text = Text.new(@input_text)
  end

  def test_swap
    swapped_text = @test_text.swap('a', 'e')

    refute_equal(@input_text, swapped_text)
  end
end
