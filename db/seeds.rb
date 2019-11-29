require('pry')
require_relative('../models/merchant.rb')

Merchant.delete_all()

# Merchants

merchant1 = Merchant.new(
  {
    'merchant_name' => 'John Lewis'
  }
)

merchant1.save()


binding.pry

nil
