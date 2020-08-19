# Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @register.give_receipt(@transaction) }
  end
end
