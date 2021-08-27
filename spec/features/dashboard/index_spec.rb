require 'rails_helper'

RSpec.describe "The user's dashboard" do
  before :each do
    @user = User.create(
      email: 'funbucket@gmail.com',
      password: 'password1',
      password_confirmation: 'password1'
    )
    @user1 = User.create(
      email: 'funbucket1@gmail.com',
      password: 'password1',
      password_confirmation: 'password1'
    )
    @user2 = User.create(
      email: 'funbucket2@gmail.com',
      password: 'password1',
      password_confirmation: 'password1'
    )
    @friend1 = Friend.create!(follower_id: @user1.id, followed_id: @user.id)

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

  describe 'Friends section' do

    it "displays the user's friend's emails" do
      within '#friends' do
        save_and_open_page
        expect(page).to have_content(@user1.email)
        expect(page).to_not have_content(@user2.email)
      end
    end

    it "can add friends" do
      within '#friends' do
        fill_in 'email', with: @user2.email
        click_on 'Add Friend'

        expect(page).to have_content(@user2.email)
      end

      expect(page).to have_content("You just added a new friend!")
    end

    it "can't add friends who are not users" do
      within '#friends' do
        fill_in 'email', with: 'sadbucket@gmail.com'
        click_on 'Add Friend'

        expect(page).to_not have_content('sadbucket@gmail.com')
      end

      expect(page).to have_content("That email is not in our system")
    end
  end
end
