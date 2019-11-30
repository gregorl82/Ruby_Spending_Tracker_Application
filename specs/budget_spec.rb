require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/budget.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class BudgetTest < MiniTest::Test

  def setup()
    @budget1 = Budget.new(
      {
        'budget_name' => 'Social Fund',
        'budget_amount' => 300.00
      }
    )
  end

  def test_can_create_budget_and_get_name()
    assert_equal('Social Fund', @budget1.budget_name)
  end

  def test_can_get_budget_amount()
    assert_equal(300.00, @budget1.budget_amount)
  end

  def test_can_alter_budget_name()
    @budget1.budget_name = 'Takeaway Fund'
    assert_equal('Takeaway Fund', @budget1.budget_name)
  end

  def test_can_alter_budget_amount()
    @budget1.budget_amount = 250.00
    assert_equal(250.00, @budget1.budget_amount)
  end

end
