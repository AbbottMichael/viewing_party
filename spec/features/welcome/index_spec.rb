require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    visit root_path
  end

  it 'displays a welcome message' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'displays a brief discription of the app' do
    description = 'This is an application to explore movies and create a viewing party event for you and your friends to watch a movie together.'
    expect(page).to have_content(description)
  end

  it 'has a link to register a new user' do
    click_on('Register a new user')
    expect(current_path).to eq(new_user_path)
  end

  describe 'log in' do
    it 'can log in with valid credentials'

    it 'can not log in with invalid credentials'
  end
end
