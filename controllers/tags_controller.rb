require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/tags' do
  tags = Tag.all()
  @tags = tags.sort_by! {|tag| tag.id}
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to ("/tags")
end

get '/tags/:id/edit' do
  @tag = Tag.find_by_id(params['id'])
  erb(:"tags/edit")
end

post '/tags/:id' do
  Tag.new(params).update()
  redirect to ("/tags")
end

post '/tags/:id/delete' do
  tag = Tag.find_by_id(params['id'])
  tag.delete()
  redirect to ("/tags")
end
