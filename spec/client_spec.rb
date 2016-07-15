require('spec_helper')

describe('Client') do
  describe('#initialize') do
    it('instantiates a client object') do
      client = Client.new({:name => 'Skip'})
      expect(client.class).to eq(Client)
    end

  end


end
