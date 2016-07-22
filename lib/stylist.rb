require('pry')
class Stylist
  attr_reader(:id, :name, :phone_number)

  define_method(:initialize) do | attributes |
    @id = attributes[:id]
    @name = attributes[:name]
    @phone_number = attributes[:phone_number]
  end

  define_method(:save) do
    result =DB.exec("INSERT INTO stylists (name, phone_number) VALUES ('#{@name}', '#{@phone_number}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_singleton_method(:find) do | id |
    stylist = nil
    results = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    results.each() do | result |
      stylist = Stylist.new({:id => result.fetch('id').to_i, :name => result.fetch('name'), :phone_number => result.fetch('phone_number')})
    end
    stylist
  end

  define_method(:==) do | other |
    self.name == other.name && self.phone_number == other.phone_number
  end

  define_singleton_method(:all) do
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each() do | result |
      stylists.push(Stylist.new({:id => result.fetch('id').to_i, :name => result.fetch('name'), :phone_number => result.fetch('phone_number')}))
    end
    stylists
  end

  define_method(:update) do | attributes |
    @id = self.id()
    @name = attributes.fetch(:name)
    @phone_number = attributes.fetch(:phone_number)
    DB.exec("UPDATE stylists SET name = '#{@name}', phone_number = '#{@phone_number}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  define_method(:client_list) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do | client |
      clients.push(Client.new({:id => client.fetch('id').to_i, :name => client.fetch('name'), :phone_number => client.fetch('phone_number'), :stylist_id => client.fetch('stylist_id').to_i}))
    end
    stylist_clients
  end
end
