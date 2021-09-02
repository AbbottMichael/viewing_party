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
      click_on 'Discover Movies'

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

      expect(page).to have_content("That email is not in our system.")
    end

    it "can't add current_user as their own friend" do
      within '#friends' do
        fill_in 'email', with: 'funbucket@gmail.com'
        click_on 'Add Friend'
      end

      expect(page).to have_content("Liking yourself is healthy... but please add a friend that is not yourself.")
    end

    it "can't add friend more than once" do
      within '#friends' do
        fill_in 'email', with: 'funbucket1@gmail.com'
        click_on 'Add Friend'
      end

      expect(page).to have_content("#{@user1.email} is already your friend.")
    end
  end

  describe 'Viewing Parties section', :vcr do
    before :each do
      visit movie_path(19404)

      click_on 'Create A Viewing Party'

      fill_in 'date_time', with: "2024-09-01T08:30"

      check 'funbucket1@gmail.com'
      click_on 'Create Party'
    end

    it 'Displays viewing parties the user is hosting' do
      expect(current_path).to eq(dashboard_path)
      within "#viewing_parties" do
        within "#hosted_parties" do
          expect(page).to have_content('Dilwale Dulhania Le Jayenge')
          expect(page).to have_content(Event.last.date_time.strftime("%B-%d-%Y"))
          expect(page).to have_content(Event.last.date_time.strftime("%I:%M%P"))
          expect(page).to have_content("Host: #{@user.email}")
          expect(page).to have_content(@user1.email)
        end
      end
    end

    it 'Displays viewing parties the user is attending' do
      attended_event = Event.create!(
        host_id: @user1.id,
        movie_id: 680,
        title: 'Pulp Fiction',
        viewing_time: 154,
        date_time: "2024-09-01T08:30"
      )
      friend2 = Friend.create!(follower_id: @user.id, followed_id: @user1.id)
      attendee = Attendee.create!(event_id: attended_event.id, user_id: @user.id)

      visit dashboard_path

      within "#viewing_parties" do
        within "#attended_parties" do
          expect(page).to have_content('Pulp Fiction')
          expect(page).to have_content(attended_event.date_time.strftime("%B-%d-%Y"))
          expect(page).to have_content(attended_event.date_time.strftime("%I:%M%P"))
          expect(page).to have_content("Host: #{@user1.email}")
          expect(page).to have_content(@user.email)
        end
      end
    end
  end
end
