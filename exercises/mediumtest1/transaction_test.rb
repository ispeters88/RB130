require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @txn = Transaction.new(48)
  end

# Ex. 6 and 7

  def test_prompt_for_payment
    inpt = StringIO.new('50\n')
    outpt = StringIO.new
    @txn.prompt_for_payment(input: inpt, output: outpt)
    assert_equal(50, @txn.amount_paid)
  end
end