require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    @user = User.create(email: 'funbucket@gmail.com', password: 'password1')

    visit root_path
  end

  it 'displays a welcome message' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'displays a brief description of the app' do
    description = 'This is an application to explore movies and create a viewing party event for you and your friends to watch a movie together.'
    expect(page).to have_content(description)
  end

  it 'has a link to register a new user' do
    click_on('Register a new user')
    expect(current_path).to eq(new_user_path)
  end

  describe 'log in' do
    it 'can log in with valid credentials' do

      fill_in 'email', with: 'funbucket@gmail.com'
      fill_in 'password', with: 'password1'

      click_on 'Log In'

      expect(current_path).to eq(dashboard_path)
    end

    it 'can not log in without a password' do
      fill_in 'email', with: 'funbucket@gmail.com'

      click_on 'Log In'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Email and Password are required to log-in.")
    end

    it 'can not log in without an email' do
      fill_in 'password', with: 'password1'

      click_on 'Log In'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Email and Password are required to log-in.")
    end
  end
end
