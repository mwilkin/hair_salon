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

    it('instantiates a client with a name and an id') do
      client = Client.new({:id => 1, :name => 'Skip',})
      expect(client.id).to eq(1)
    end

    it('instantiates a client with a name and an id and a phone_number') do
      client = Client.new({:id => 1, :name => 'Skip', :phone_number => '541-111-2222'})
      expect(client.phone_number).to eq('541-111-2222')
    end
  end



end
