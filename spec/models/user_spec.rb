require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many(:followed) }
    it { should have_many(:followers) }
    it { should have_many(:events) }
    it { should have_many(:attendees) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'instance methods' do
    describe '#friends?' do
      it "can determine if the users are friends" do
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

        expect(@user.friends?(@user1)).to eq(true)
        expect(@user.friends?(@user2)).to eq(false)
      end
    end
  end
end
