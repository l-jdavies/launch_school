# Transaction#prompt_for_payment has a call to Kernel#puts and that output is showing up when we run our test. Your task for this exercise is to make it so that we have "clean" output when running this test. 

# You may make changes to the Transaction#prompt_for_payment method to fulfill the requirements of this exercise. Note that you should not remove the calls to puts.

def prompt_for_payment(input: $stdin, output: $stdout)
  loop do
    output.puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    output.puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end


require 'stringio'
require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    amount = StringIO.new("60\n")
    output_text = StringIO.new
    @transaction.prompt_for_payment(input: amount, output: output_text)
    
    assert_equal(60, @transaction.amount_paid)
  end
end
