require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'Relationships' do
    it { should belong_to(:event) }
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
    @attendee = Attendee.create!(event_id: @attended_event.id, user_id: @user.id)

  end

  describe 'instance methods' do
    describe '#find_email' do
      it 'can find attendee email by user id' do
        expect(@attendee.find_email).to eq(@user.email)
      end
    end

    describe '#find_event_by_id' do
      it 'can find an event by attendee id' do
        expect(@attendee.find_event_by_id).to eq(@attended_event)
      end
    end
  end
end
