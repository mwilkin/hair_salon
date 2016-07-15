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

end
