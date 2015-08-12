require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it("gets the index page") do
    visit('/')
    expect(page).to have_content("CD")
  end
end
