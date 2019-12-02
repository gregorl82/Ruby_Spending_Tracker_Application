require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/budget.rb')
also_reload('../models/*')

get '/budgets' do
  budgets = Budget.all()
  @budgets = budgets.sort_by {|budget| budget.id}
  erb(:"budgets/index")
end

get '/budgets/new' do
  erb(:"budgets/new")
end

post '/budgets' do
  budget = Budget.new(params)
  budget.save()
  redirect to ("/budgets")
end

get '/budgets/:id' do
  id = params['id'].to_i()
  budget = Budget.find_by_id(id)
  total_spent = budget.total_spent()
  @id = id
  @name = budget.budget_name
  @remaining = budget.budget_amount - total_spent
  @spent = total_spent
  @transactions = budget.transactions()
  erb(:"budgets/show")
end

post '/budgets/:id' do
  budget = Budget.new(params)
  budget.update()
  redirect to ("/budgets")
end

get '/budgets/:id/edit' do
  @budget = Budget.find_by_id(params['id'])
  erb(:"budgets/edit")
end

get '/budgets/:id/:order' do
  id = params['id'].to_i()
  order = params['order']
  budget = Budget.find_by_id(id)
  total_spent = budget.total_spent()
  @id = id
  @name = budget.budget_name
  @remaining = budget.budget_amount - total_spent
  @spent = total_spent
  transactions = budget.transactions()
  if order == 'asc'
    @transactions = transactions.sort_by! {|transaction| transaction.transaction_time}
  elsif order == 'desc'
    @transactions = transactions.sort_by! {|transaction| transaction.transaction_time}.reverse
  end
  erb(:"budgets/show")
end

post '/budgets/:id/delete' do
  budget = Budget.find_by_id(params['id'])
  budget.delete()
  redirect to ("/budgets")
end
