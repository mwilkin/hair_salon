require('rspec')
require('pg')
require('stylists')
require('clients')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.confige do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists;")
    DB.exec("DELETE FROM clients;")
    DB.exec("DELETE FROM stylists_clients")
  end
