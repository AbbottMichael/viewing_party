require 'rails_helper'

RSpec.describe "The user's dashboard" do
  before :each do
    @user = User.create(
      email: 'funbucket@gmail.com',
      password: 'password1',
      password_confirmation: 'password1'
    )

    visit root_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Log In'
  end

  describe 'page layout' do
    it "has a link to 'Log Out' that redirects to Welcome page" do
      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end

    it 'displays a welcome message that mentions the user by email' do
      expect(page).to have_content("Welcome #{@user.email}!")
    end

    it "displays a button to 'Discover Movies'" do
      click_button 'Discover Movies'

      expect(current_path).to eq(discover_path)
    end

    it "displays a 'Friends' section" do
      within "#friends" do
        expect(page).to have_content('Friends')
      end
    end

    it "displays a 'Viewing Parties' section" do
      within "#viewing_parties" do
        expect(page).to have_content('Viewing Parties')
      end
    end
  end
end
