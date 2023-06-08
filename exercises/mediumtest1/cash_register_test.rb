require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @reg = CashRegister.new(0)
    @txn = Transaction.new(48)
  end

# ex 2. We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.

  def test_accept_money
    @txn.amount_paid = 50
    prior = @reg.total_money
    @reg.accept_money(@txn)

    assert_equal(prior + 50, @reg.total_money)
  end

# ex 3. Write a test for the method, CashRegister#change.

  def test_change
    @txn.amount_paid = 50
    chg = @reg.change(@txn)

    assert_equal(2, chg)
  end

# ex 4. Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

  def test_give_receipt
    recp = "You've paid $48.\n"

    assert_output(recp) { @reg.give_receipt(@txn) }
    assert_nil(@reg.give_receipt(@txn))
  end
end