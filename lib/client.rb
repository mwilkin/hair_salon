class Client

  attr_reader(:id, :name, :phone_number, :stylist_id)

  define_method(:initialize) do | attributes |
    @id = attributes[:id]
    @name = attributes[:name]
    @phone_number = attributes[:phone_number]
    @stylist_id = attributes[:stylist_id]

  end

  

end
