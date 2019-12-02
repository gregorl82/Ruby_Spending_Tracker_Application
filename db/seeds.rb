require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/budget.rb')
require_relative('../models/transaction.rb')

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()
Budget.delete_all()

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

# Budgets

budget1 = Budget.new(
  {
    'budget_name' => 'Hobbies',
    'budget_amount' => 300.00,
    'warning_limit' => 30.00
  }
)

budget1.save()

budget2 = Budget.new(
  {
    'budget_name' => 'Christmas shopping',
    'budget_amount' => 120.00,
    'warning_limit' => 0.00
  }
)

budget2.save()

budget3 = Budget.new(
  {
    'budget_name' => 'Food budget',
    'budget_amount' => 170.00,
    'warning_limit' => 25.00
  }
)

budget3.save()

# Transactions

transaction1 = Transaction.new(
  {
    'merchant_id' => merchant1.id,
    'tag_id' => tag1.id,
    'budget_id' => budget2.id,
    'amount' => 34.99,
    'transaction_time' => '2019-11-28 14:30'
  }
)

transaction1.save()

transaction2 = Transaction.new(
  {
    'merchant_id' => merchant2.id,
    'tag_id' => tag1.id,
    'budget_id' => budget2.id,
    'amount' => 25.00,
    'transaction_time' => '2019-11-27 12:25'
  }
)

transaction2.save()

transaction3 = Transaction.new(
  {
    'merchant_id' => merchant3.id,
    'tag_id' => tag3.id,
    'budget_id' => budget3.id,
    'amount' => 12.00,
    'transaction_time' => '2019-11-27 10:20'
  }
)

transaction3.save()

binding.pry

nil
