require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/transaction.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TransactionTest < MiniTest::Test

  def setup()
    @transaction1 = Transaction.new(
      {
        'merchant_id' => 1,
        'tag_id' => 3,
        'budget_id' => 1,
        'amount' => 25.99,
        'transaction_time' => '2019-11-30 12:30'
      }
    )
  end

  def test_can_create_new_transaction_and_get_amount()
    assert_equal(25.99, @transaction1.amount)
  end

  def test_can_get_merchant_id()
    assert_equal(1, @transaction1.merchant_id)
  end

  def test_can_get_tag_id()
    assert_equal(3, @transaction1.tag_id)
  end

  def test_can_get_budget_id()
    assert_equal(1, @transaction1.budget_id)
  end

  def test_can_get_time()
    assert_equal('2019-11-30 12:30', @transaction1.transaction_time)
  end

end
