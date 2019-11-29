require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

Merchant.delete_all()

# Merchants

merchant1 = Merchant.new(
  {
    'merchant_name' => 'John Lewis'
  }
)

merchant1.save()

# Tags

tag1 = Tag.new(
  {
    'tag_name' => 'entertainment'
  }
)

tag1.save()

binding.pry

nil
