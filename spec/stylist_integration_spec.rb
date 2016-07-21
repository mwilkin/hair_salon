require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to view stylist list', {:type => :feature}) do
  it('displays list of stylists') do
    visit('/')
    click_link('Stylists')
    expect(page).to have_content('Stylist List')
  end
end

describe('path to add a new stylist', {:type => :feature}) do
  it('allows the user to add a new stylist') do
    visit('/')
    click_link('Stylists')
    expect(page).to have_content('There are no stylists currently.')

  end
end

describe('add a new stylist', {:type => :feature}) do
  it 'allows user to add a new stylist' do
    visit('/')
    click_link('Stylists')
    fill_in('name', :with => "Le Clipper")
    fill_in('phone_number', :with => "100-100-1220")
    click_button('Add Stylist')
    expect(page).to have_content("Add a Stylist")
  end
end

# describe('delete a stylist', {:type => :feature}) do
#   it('allows the user to delete a stylist') do
#     stylist = Stylist.new({:id => nil, :name => "Guy", :phone_number => "511-541-1515"})
#     stylist.save()
#     visit('/')
#     click_link('Stylists')
#     click_link('Guy')
#     expect(page).to have_content("New Name")
#   end
# end

# describe('update a stylist', {:type => :feature}) do
#   it('allows a user to update a stylists information') do
#     stylist = Stylist.new({:id => nil, :name => "Timmy", :phone_number => "511-541-1515"})
#     stylist.save()
#     visit('/stylists')
#     click_link('Timmy')
#     fill_in('new_name', :with => "Timmy Jones")
#     fill_in('new_phone_number', :with => "120-210-1234")
#     click_button('Update Stylist')
#     expect(page).to have_content("Timmy Jones")
#   end
# end
