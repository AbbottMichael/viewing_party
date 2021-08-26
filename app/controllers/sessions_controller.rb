class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user == nil
      flash[:error] = "Email can not be blank."
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

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
