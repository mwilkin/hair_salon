require('spec_helper')

describe('Stylist') do
  describe('#initialize') do
    it('instantiates a stylist object') do
      sylist = Stylist.new({:name => 'Griff'})
      expect(sylist.class).to eq(Stylist)
    end

    it('instantiates a stylist with a name') do
      stylist = Stylist.new({:name => 'Griff'})
      expect(stylist.name).to eq('Griff')
    end

    it('instantiates a Stylist with an id') do
      Stylist = Stylist.new({:id => 1, :name => 'Griff',})
      expect(Stylist.id).to eq(1)
    end


  end


end
