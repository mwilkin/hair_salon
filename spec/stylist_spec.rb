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

  describe('.all') do
    it('returns an array of all stylists') do
      stylist1 = Stylist.new({:name => 'Skip Dance', :phone_number => '541-111-2222'})
      stylist1.save()
      stylist2 = Stylist.new({:name => 'Hip Hop', :phone_number => '541-100-2000'})
      stylist2.save()
      stylist3 = Stylist.new({:name => 'Twirl Spin', :phone_number => '541-200-2200'})
      stylist3.save()
      expect(Stylist.all).to eq([stylist1, stylist2, stylist3])
    end
  end

  describe('#update') do
  it("lets you update stylists information in the database") do
    test_stylist = Stylist.new({:name => 'Hip Hop', :phone_number => '541-100-2000'})
    test_stylist.save()
    test_stylist.update({:name => "Cindy Lopper", :phone_number => '503-799-8756'})
    expect(test_stylist.name()).to eq("Cindy Lopper")
  end
end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      stylist1 = Stylist.new({:name => 'Skip Dance', :phone_number => '541-111-2222'})
      stylist1.save()
      stylist2 = Stylist.new({:name => 'Hip Hop', :phone_number => '541-100-2000'})
      stylist2.save()
      stylist3 = Stylist.new({:name => 'Twirl Spin', :phone_number => '541-200-2200'})
      stylist3.save()
      stylist2.delete()
      expect(Stylist.all()).to eq([stylist1, stylist3])
    end
  end
end
