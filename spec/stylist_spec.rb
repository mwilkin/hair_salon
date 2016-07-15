require('spec_helper')

describe('Stylist') do
  describe('#initialize') do
    it('instantiates a stylist object') do
      sylist = Stylist.new({:name => 'Griff'})
      expect(sylist.class).to eq(Stylist)
    end

  end
end
