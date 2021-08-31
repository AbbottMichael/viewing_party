require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'Relationships' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
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
    @friend1 = Friend.create!(follower_id: @user1.id, followed_id: @user.id)
  end

  describe 'instance methods' do
    describe '#find_email' do
      it "can find the email of the friend" do
        expect(@friend1.find_email).to eq(@user1.email)
      end
    end
  end
end
