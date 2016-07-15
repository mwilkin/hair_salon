class Client

  attr_reader(:id, :name, :phone_number)

  define_method(:initialize) do | attributes |
    @id = attributes[:id]
    @name = attributes[:name]



  end


end
