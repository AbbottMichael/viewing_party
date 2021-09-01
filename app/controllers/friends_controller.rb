class FriendsController < ApplicationController
  def create
    follower = User.find_by(email: params[:email])
    if follower.nil?
      flash[:error] = 'That email is not in our system'
    else
      Friend.create(followed_id: current_user.id, follower_id: follower.id)
      flash[:success] = 'You just added a new friend!'
    end
    redirect_to dashboard_path
  end
end
