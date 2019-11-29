require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/tags' do
  tags = Tag.all()
  @tags = tags.sort_by! {|tag| tag.id}
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end
