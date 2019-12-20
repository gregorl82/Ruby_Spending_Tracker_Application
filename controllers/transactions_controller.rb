require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/month.rb')

get '/transactions' do
  @tags = Tag.all()
  @budgets = Budget.all()
  @total = Transaction.total()
  @months = Month.all()
  @transactions = Transaction.all()
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
  @transactions = Transaction.filter_by_tag(@tag)
  @total = Transaction.get_total(@transactions)
  erb(:"transactions/filteredbytag")
end

get '/transactions/:id/edit' do
  @tags = Tag.all()
  @budgets = Budget.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
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

get '/transactions/order/:order' do
  order = params['order']
  @months = Month.all()
  @tags = Tag.all()
  @budgets = Budget.all()
  @total = Transaction.total()
  if order == 'asc'
    @transactions = Transaction.order_by_time()
  elsif order == 'desc'
    @transactions = Transaction.order_by_time().reverse
  end
  erb(:"transactions/index")
end

get '/transactions/orderbytag/:tag/:order' do
  order = params['order']
  @tag = params['tag']
  transactions = Transaction.filter_by_tag(@tag)
  if (order == 'asc')
    @transactions = transactions.sort_by! {|transaction| transaction.transaction_time}
  elsif (order == 'desc')
    @transactions = transactions.sort_by! {|transaction| transaction.transaction_time}.reverse
  end
  @total = Transaction.get_total(@transactions)
  erb(:"transactions/filteredbytag")
end

get '/transactions/month/:month' do
  month = params['month']
  @month = month
  transactions = Transaction.all()
  @transactions = Transaction.get_transactions_by_month(transactions, month)
  @total = Transaction.get_total(@transactions)
  erb(:"transactions/filteredbymonth")
end

get '/transactions/month/:month/:order' do
  order = params['order']
  month = params['month']
  @month = month
  transactions = Transaction.all()
  filtered_transactions = Transaction.get_transactions_by_month(transactions, month)
  if (order == 'asc')
    @transactions = filtered_transactions.sort_by! {|transaction| transaction.transaction_time}
  elsif (order == 'desc')
    @transactions = filtered_transactions.sort_by! {|transaction| transaction.transaction_time}.reverse
  end
  @total = Transaction.get_total(@transactions)
  erb(:"transactions/filteredbymonth")
end
