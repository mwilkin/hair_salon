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
    expect(page).to have_content('Client List')
  end
end
