require('spec_helper')

describe('Client') do
  describe('#initialize') do
    it('instantiates a client object') do
      client = Client.new({:name => 'Skip'})
      expect(client.class).to eq(Client)
    end

    it('instantiates a client with a name') do
      client = Client.new({:name => 'Skip'})
      expect(client.name).to eq('Skip')
    end

    it('instantiates a client with an id') do
      client = Client.new({:id => 1, :name => 'Skip',})
      expect(client.id).to eq(1)
    end

    it('instantiates a client with a phone_number') do
      client = Client.new({:id => 1, :name => 'Skip', :phone_number => '541-111-2222'})
      expect(client.phone_number).to eq('541-111-2222')
    end

    it('instantiates a client with a stylist_id') do
      client = Client.new({:id => 1, :name => 'Skip', :phone_number => '541-111-2222', :stylist_id => 1})
      expect(client.stylist_id).to eq(1)
    end
  end

  describe('#save') do
    it('create/stores client objects on the datatbase') do
      client =  Client.new({:id => 1, :name => 'Skip', :phone_number => '541-111-2222', :stylist_id => 1})
      client.save()
      result = DB.exec("SELECT name FROM clients WHERE name = 'Skip';")
      expect(result.getvalue(0,0)).to eq("Skip")
    end
  end

  describe('.find') do
    it('will return a single client from the database') do
      client1 = Client.new({:name => 'Skip', :phone_number => '541-111-2222', :stylist_id => 1})
      client1.save()
      expect(Client.find(client1.id)).to eq(client1)
    end
  end

  describe('#==') do
      it('will test for equality of two objects') do
        client1 = Client.new({:id => 1, :name => 'Skip Dance', :phone_number => '541-111-2222', :stylist_id => 1})
        client1.save()
        client2 = Client.find(client1.id)
        client2.save()
        expect(client1).to eq(client2)
      end
    end

  describe('.all') do
    it('returns an array of all clients') do
      client1 = Client.new({:name => 'Skip Dance', :phone_number => '541-111-2222', :stylist_id => 1})
      client1.save()
      client2 = Client.new({:name => 'Hip Hop', :phone_number => '541-100-2000', :stylist_id => 1})
      client2.save()
      client3 = Client.new({:name => 'Twirl Spin', :phone_number => '541-200-2200', :stylist_id => 1})
      client3.save()
      expect(Client.all).to eq([client1, client2, client3])
    end
  end

  describe('#add_stylist') do
    it('should assign a parameter value to @stylist_id') do
      new_client = Client.new({:name => 'Luca Brazzi', :phone_number => '781-322-3456', :stylist_id => 0})
      new_client.save()
      new_client.add_stylist(1)
      expect(new_client.stylist_id).to eq(1)
    end
  end

  describe('#delete') do
    it('will allow a client to be deleted from the DB') do
      new_client = Client.new({:name => 'Tom Clancy', :phone_number => '503-799-8756', :stylist_id => 1})
      new_client.save()
      new_client2 = Client.new({:name => 'Michael Creighton', :phone_number => '781-599-0101', :stylist_id => 1})
      new_client2.save()
      new_client.delete()
      expect(Client.all()).to eq([new_client2])
    end
  end

    describe('#update') do
    it("lets you update clients information in the database") do
      test_client = Client.new({:name => "Mindy Hinz", :phone_number => '503-799-8756', :stylist_id => 1, :id => 2})
      test_client.save()
      test_client.update({:name => "Cindy Lopper", :phone_number => '503-799-8756', :stylist_id => 1, :id => 2})
      expect(test_client.name()).to eq("Cindy Lopper")
    end
  end

end
