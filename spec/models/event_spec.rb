require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Relationships' do
    it { should have_many(:attendees) }
    it { should belong_to(:user) }
  end
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
    @attended_event = Event.create!(
      host_id: @user1.id,
      movie_id: 680,
      title: 'Pulp Fiction',
      viewing_time: 154,
      date_time: "2024-09-01T08:30"
    )
  end

  describe 'instance methods' do
    describe '#find_host_email' do
      it "can find the email of the event host" do
        expect(@attended_event.find_host_email).to eq(@user1.email)
      end
    end
  end
end
