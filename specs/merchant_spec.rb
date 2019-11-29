require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/merchant.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class MerchantTest < MiniTest::Test

  def test_can_create_merchant_and_get_name()
    merchant1 = Merchant.new(
      {
        'merchant_name' => 'Amazon'
      }
    )
    assert_equal('Amazon', merchant1.merchant_name)
  end

end
