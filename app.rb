require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')
require('pry')

get ('/') do
  erb(:index)
end

get ('/clients') do
  erb(:clients)
end

get ('/client_view') do
  erb(:)
end

post ('/client_update') do
  erb(:)
end
