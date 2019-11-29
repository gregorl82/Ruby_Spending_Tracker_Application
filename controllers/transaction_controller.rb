require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/transactions' do
  @total = Transaction.total()
  @transactions = Transaction.all()
  erb(:"transactions/index")
end
