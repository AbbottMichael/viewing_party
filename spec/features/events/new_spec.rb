require 'rails_helper'

RSpec.describe 'The Viewing Party New page' do
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
    @user3 = User.create(
      email: 'funbucket3@gmail.com',
      password: 'password1',
      password_confirmation: 'password1'
    )
    @friend1 = Friend.create!(follower_id: @user1.id, followed_id: @user.id)
    @friend2 = Friend.create!(follower_id: @user2.id, followed_id: @user.id)

    visit root_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Log In'
  end

    it 'displays a form to create a new viewing party', :vcr do
      visit movie_path(19404)

      click_on "Create A Viewing Party"

      expect(current_path).to eq(viewing_party_new_path)
      expect(page).to have_field(:title, with: "Dilwale Dulhania Le Jayenge")
      expect(page).to have_field(:viewing_time, with: 190)
      expect(page).to have_content("#{@user1.email}")
      expect(page).to have_content("#{@user2.email}")
      expect(page).to_not have_content("#{@user3.email}")

      select "2021", from: "[day(1i)]"
      select "August", from: "[day(2i)]"
      select "29", from: "[day(3i)]"
      select "14", from: "[start_time(4i)]"
      select "30", from: "[start_time(5i)]"

      check "#{@user1.email}"

      click_on "Create Party"

      expect(current_path).to eq(dashboard_path)

      within "#viewing_parties" do
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      end
    end
end
