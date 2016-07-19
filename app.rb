require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

get ('/') do
  erb(:index)
end

get ('/clients') do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end

get ('/client/add') do


  erb(:client_new)
end


post ('clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end

get('/clients/:id') do
  @clients = Client.all()
  @client = Client.find(params.fetch('id').to_i())
  @stylist = Stylist.find(@client.stylist.id())
  @stylist = Stylist.all()
  erb(:client)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  name = params.fetch('new_client_name')
  stylist_id = params.fetch('new_stylist_id')
  @stylist = Stylist.find((stylist_id).to_i())
  @client.update({:name => name, :stylist_id => stylist_id})
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:client)
end

delete("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end
