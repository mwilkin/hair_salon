require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')

get ('/') do


  erb(:index)
end
