require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user with valid inputs" do
    visit root_path

    click_on "Register a new user"

    expect(current_path).to eq("/register")

    email = "funbucket@gmail.com"
    password = "password1"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Create User"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{email}!")
  end

  it "does not create a new user when passwords do not match" do
    visit root_path

    click_on "Register a new user"

    expect(current_path).to eq("/register")

    email = "funbucket@gmail.com"
    password = "password1"
    password2 = "password"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password2

    click_on "Create User"
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it "does not create a new user when password or password_confirmation is blank" do
    visit root_path
    error_msg = "Password confirmation doesn't match Password, Password confirmation can't be blank, and Password can't be blank"

    click_on "Register a new user"

    expect(current_path).to eq("/register")

    email = "funbucket@gmail.com"

    fill_in 'user[email]', with: email

    click_on "Create User"
    expect(current_path).to eq(register_path)
    expect(page).to have_content(error_msg)
  end

  it "does not create a new user when email is blank" do
    visit root_path
    error_msg = "Email can't be blank"

    click_on "Register a new user"

    expect(current_path).to eq("/register")

    password = "password1"

    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Create User"
    expect(current_path).to eq(register_path)
    expect(page).to have_content(error_msg)
  end
end
