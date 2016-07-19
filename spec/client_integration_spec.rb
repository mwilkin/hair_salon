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
