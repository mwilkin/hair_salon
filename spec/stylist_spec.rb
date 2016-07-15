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
      stylist = Stylist.new({:id => 1, :name => 'Griff',})
      expect(stylist.id).to eq(1)
    end

    it('instantiates a stylist with a phone_number') do
      stylist = Stylist.new({:id => 1, :name => 'Griff', :phone_number => '541-101-0002'})
      expect(stylist.phone_number).to eq('541-101-0002')
    end
  end

  describe('#save') do
    it('create/stores stylist objects on the datatbase') do
      stylist =  Stylist.new({:id => 1, :name => 'Griff', :phone_number => '541-101-0002'})
      stylist.save()
      result = DB.exec("SELECT name FROM stylists WHERE name = 'Griff';")
      expect(result.getvalue(0,0)).to eq('Griff')
    end
  end

  describe('.find') do
    it('will return a single stylist from the database') do
      stylist = Stylist.new({:name => 'Griff', :phone_number => '541-111-2222'})
      stylist.save()
      expect(Stylist.find(stylist.id)).to eq(stylist)
    end
  end

  describe('#==') do
      it('will test for equality of two objects') do
        stylist1 = Stylist.new({:id => 1, :name => 'Skip Dance', :phone_number => '541-111-2222'})
        stylist1.save()
        stylist2 = Stylist.find(stylist1.id)
        stylist2.save()
        expect(stylist1).to eq(stylist2)
      end
    end


end
