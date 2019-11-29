require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()

# Merchants

merchant1 = Merchant.new(
  {
    'merchant_name' => 'John Lewis'
  }
)

merchant1.save()

merchant2 = Merchant.new(
  {
    'merchant_name' => 'Amazon'
  }
)

merchant2.save()

merchant3 = Merchant.new(
  {
    'merchant_name' => 'WH Smith'
  }
)

merchant3.save()

# Tags

tag1 = Tag.new(
  {
    'tag_name' => 'entertainment'
  }
)

tag1.save()

tag2 = Tag.new(
  {
    'tag_name' => 'groceries'
  }
)

tag2.save()

tag3 = Tag.new(
  {
    'tag_name' => 'stationery'
  }
)

tag3.save()

# Transactions

transaction1 = Transaction.new(
  {
    'merchant_id' => merchant1.id,
    'tag_id' => tag1.id,
    'amount' => 34.99
  }
)

transaction1.save()

transaction2 = Transaction.new(
  {
    'merchant_id' => merchant2.id,
    'tag_id' => tag1.id,
    'amount' => 25.00
  }
)

transaction2.save()

transaction3 = Transaction.new(
  {
    'merchant_id' => merchant3.id,
    'tag_id' => tag3.id,
    'amount' => 12.00
  }
)

transaction3.save()

binding.pry

nil
