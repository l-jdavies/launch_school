# Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. 

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
    @transaction.prompt_for_payment(input: amount)
    
    assert_equal(60, @transaction.amount_paid)
  end
end
