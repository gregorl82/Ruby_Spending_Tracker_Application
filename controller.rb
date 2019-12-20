require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/budgets_controller.rb')

get '/' do
  erb(:index)
end
