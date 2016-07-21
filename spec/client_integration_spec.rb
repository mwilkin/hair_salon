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

# describe('path to add a client', {:type => :feature}) do
#   it('allows user to add a new client') do
#     visit('/clients')
#     fill_in('name', :with => 'Tom Jones')
#     fill_in('Client Phone Number: ', :with => '541-123-3214')
#     select('Santa Claus', :from => 'stylist_id')
#     click_button('Add Client')
#     expect(page).to have_content('Tom Jones')
#
#   end
# end
