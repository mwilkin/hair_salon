 require('capybara/rspec')
 require('./app')

 Capybara.app = Sinatra::Application
 set(:show_exceptions, false)

describe('root path', {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Chop Shop Salon')
  end
end

describe('path to view client list', {:type => :feature}) do
  it('displays list of clients') do
    visit('/')
    click_link('Clients')
    expect(page).to have_content('Please add stylist before adding a client.')
  end
end

# describe('add a client', {:type => :feature}) do
#   it('allows user to add a new client') do
#     stylist = Stylist.new({:id => nil, :name => "Le Chopper", :phone_number => "101-101-1001"})
#     stylist.save()
#     visit('/')
#     click_link('Clients')
#     fill_in('name', :with => 'Tom Jones')
#     fill_in('phone_number', :with => '541-123-3214')
#     select('Le Chopper', :from => 'stylist_id')
#     click_button('Add Client')
#     expect(page).to have_content('Tom Jones')
#   end
# end

# describe('delete a client', {:type => :feature}) do
#   it('allows user to delete a client') do
#     stylist = Stylist.new({:id => nil, :name => "Le Chopper", :phone_number => "101-101-1001"})
#     stylist.save()
#     visit('/')
#     click_link('Clients')
#     click_link('Le Chopper')
#     click_button('Delete Client')
#     expect(page).to have_content('There are no clients currently.')
#   end
# end

# describe('path to update a client', {:type => :feature}) do
#   it('will allow a user to update client information') do
#     stylist = Stylist.new({:id => nil, :name => "Timmy", :phone_number => "511-541-1515"})
#     stylist.save()
    # stylist1 = Stylist.new({:id => nil, :name => "Chipper", :phone_number => "211-555-1005"})
#     stylist1.save()
#     client = Client.new({:id => nil, :name => "john", :phone_number => "100-777-9988", :stylist_id => nil})
#     client.save()
#     visit('/clients')
#     click_link('john')
#     fill_in('new_client_name', :with => "John Black")
#     fill_in('new_client_phone_number', :with => "444-555-7878")
#     select('Chipper', :from => 'new_stylist_id')
#     click_button('Update')
#     expect(page).to have_content('John Black')
#   end
# end
