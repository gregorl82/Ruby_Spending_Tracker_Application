require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

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

binding.pry

nil
