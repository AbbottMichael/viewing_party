class UsersController < ApplicationController
  skip_before_action :authorized?

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
