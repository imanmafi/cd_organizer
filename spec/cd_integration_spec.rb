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

describe('/albums/', {:type => :feature}) do
  it("displays a list of albums and a message when no albums are present") do
    visit('/')
    click_button("Album List")
    expect(page).to have_content("You haven't added any albums.")
  end
end
