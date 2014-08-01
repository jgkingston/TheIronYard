require 'sinatra'
require 'data_mapper'

#Initialize the Database Connection
DataMapper.setup(
  :default,
  'mysql://root@localhost/blogroll'
  )

class Blogpost
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :timestamp, String
  property :lastedit, String

end

DataMapper.finalize.auto_upgrade!

# Index/Home page
get '/' do
  @blogposts = Blogpost.all
  erb :index, layout: :layout  
end

#Add New Post page
get '/create_post' do
  erb :create_post, layout: :layout
end

post '/create_post' do
  @blogpost = Blogpost.create params[:blogpost]
  redirect to ('/')
end

#Edit Existing Post page
get '/edit_post/:id' do
  @blogpost = Blogpost.get params[:id]
  erb :edit_post, layout: :layout
end

put '/edit_post/:id' do
  @blogpost = Blogpost.get params[:id]
  @blogpost.update params[:blogpost]
  redirect to ('/')
end

#Show Blogpost Before Delete
get '/show_post/:id' do
  @blogpost = Blogpost.get params[:id]
  erb :show_post, layout: :layout
end

#Destroys object in table
delete '/delete_post/:id' do
  @blogpost = Blogpost.get params[:id]
  @blogpost.destroy
  redirect to ('/')
end

