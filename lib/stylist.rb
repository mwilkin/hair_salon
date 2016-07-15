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

end
