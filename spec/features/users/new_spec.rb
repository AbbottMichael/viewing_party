require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Register a new user"

    expect(current_path).to eq("/register")

    email = "funbucket@gmail.com"
    password = "password1"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password

    click_on "Create User"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{email}!")
  end
end
