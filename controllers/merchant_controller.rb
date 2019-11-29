require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/merchants' do
  merchants = Merchant.all()
  @merchants = merchants.sort_by {|merchant| merchant.id}
  erb(:"merchants/index")
end
