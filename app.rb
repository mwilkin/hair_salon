require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')
require('./lib/stylists')
require('./lib/clients')
require('pry')

get ('/') do


  erb(:index)
end
