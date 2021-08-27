class FriendsController < ApplicationController
  def create
    follower = User.find_by(email: params[:email])
    if follower.nil?
      flash[:error] = "That email is not in our system"
      redirect_to dashboard_path
    else
      new_friend = Friend.create(followed_id: current_user.id, follower_id: follower.id)
      flash[:success] = "You just added a new friend!"
      redirect_to dashboard_path
    end
  end
end
