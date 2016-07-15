class Client

  attr_reader(:id, :name, :phone_number, :stylist_id)

  define_method(:initialize) do | attributes |
    @id = attributes[:id]
    @name = attributes[:name]
    @phone_number = attributes[:phone_number]
    @stylist_id = attributes[:stylist_id]

  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, phone_number, stylist_id) VALUES ('#{@name}', '#{@phone_number}', '#{@stylist_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_singleton_method(:find) do | id |
    client = nil
    results = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    results.each() do | result |
      client = Client.new({:id => result.fetch('id').to_i, :name => result.fetch('name'), :phone_number => result.fetch('phone_number'), :stylist_id => result.fetch('stylist_id').to_i})
    end
    client
  end

  define_method(:==) do | other |
    self.name == other.name && self.phone_number == other.phone_number && self.stylist_id == other.stylist_id
  end

  define_singleton_method(:all) do
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each() do | result |
      clients.push(Client.new({:id => result.fetch('id').to_i, :name => result.fetch('name'), :phone_number => result.fetch('phone_number'), :stylist_id => result.fetch('stylist_id').to_i}))
    end
    clients
  end

  define_singleton_method(:client_list) do | stylist_id |
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = '#{stylist_id}';")
    returned_clients.each() do | result |
      clients.push(Client.new({:name => result.fetch('id').to_i, :name => result.fetch('name'), :phone_number => result.fetch('phone_number'), :stylist_id => result.fetch('stylist_id').to_i}))
    end
    clients
  end

end
