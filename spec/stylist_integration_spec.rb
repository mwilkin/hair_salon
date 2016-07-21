require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

RSpec.configure do | config |
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end

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
    visit('/stylists')
    fill_in('name', :with => "Santa Claus")
    fill_in('phone', :with => "100-100-1220")
    click_button('Add Stylist')
    expect(page).to have_content('Santa Claus')
  end
end
