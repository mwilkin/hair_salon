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
end
