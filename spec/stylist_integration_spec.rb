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
    expect(page).to have_content('Chop Shop Salon Stylist List')

  end
end
