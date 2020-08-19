# Write a test for the method, CashRegister#change.

require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_change
    @transaction.amount_paid = 60

    change = @register.change(@transaction)
    assert_equal(10, change)
  end
end
