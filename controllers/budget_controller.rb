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
