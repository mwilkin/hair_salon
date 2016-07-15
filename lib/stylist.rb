class Stylist
  attr_reader(:id, :name, :phone_number)

  define_method(:initialize) do | attributes |
    @id = attributes[:id]
    @name = attributes[:name]
    @phone_number = attributes[:phone_number]
  end




  
end
