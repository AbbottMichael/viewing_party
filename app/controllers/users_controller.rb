class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = user_params
      user[:email] = user[:email].downcase
      new_user = User.create(user)
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Passwords do not match."
      redirect_to register_path
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if params[:email] == "" || params[:password] == ""
      flash[:error] = "Email and Password are required to log-in."
      redirect_to root_path
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
