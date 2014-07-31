require 'sinatra'

get "/" do
  'Hello world'
end

get "/i_am_awesome" do
  "I am awesome"
end

get '/hello_world' do
  erb :hello_world
end

get '/display_names' do
  dude = "Sup"
  @names = [ 
    {first_name: "Sam", last_name: "Waller"}, {first_name: "Jamie", last_name: "Kingston"}, {first_name: "Jim", last_name: "Rambow"} 
  ]
  erb :display_names
end

get '/test/:name' do |var|
  # This just prints to the terminal
  p params
  # This prints to the webage and to the terminal
  p var
end