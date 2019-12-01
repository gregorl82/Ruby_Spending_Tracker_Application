require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/transactions' do
  @tags = Tag.all()
  @budgets = Budget.all()
  @total = Transaction.total()
  transactions = Transaction.all()
  @transactions = transactions.sort_by! {|transaction| transaction.id}
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all()
  @budgets = Budget.all()
  @merchants = Merchant.all()
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to ("/transactions")
end

get '/transactions/:tag' do
  @tag = params['tag']
  @transactions = Transaction.filter_by_tag(params['tag'])
  erb(:"transactions/filtered")
end

get '/transactions/:id/edit' do
  @tags = Tag.all()
  @budgets = Budget.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find_by_id(params[:id])
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  Transaction.new(params).update()
  redirect to ("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to ("/transactions")
end
