require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    visit root_path
  end

  it 'displays a welcome message' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'displays a brief discription of the app'

  describe 'log in' do
    it 'can log in with valid credentials'

    it 'can not log in with invalid credentials'
  end

  it 'has a link to register a new user'
end
